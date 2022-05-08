import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/datasources/portfolio_datasource_interface.dart';
import 'package:portfoliov2/app/modules/portfolio/infra/models/portfolio_model.dart';

class FirebasePortfolioDatasource implements IPortfolioDatasource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  FirebasePortfolioDatasource({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  @override
  Future<List<Portfolio>> fetchPortfolios() async {
    final portfoliosCollection = firebaseFirestore.collection('portfolios');
    final QuerySnapshot<Map<String, dynamic>> portfoliosMap;
    try {
      portfoliosMap = await portfoliosCollection.get();
    } catch (e) {
      throw Exception(e.toString());
    }
    final portfolios = portfoliosMap.docs.map((e) => PortfolioModel.fromMap(e.data())).toList();
    return portfolios;
  }

  @override
  Future<void> removePortfolio({required Portfolio portfolio}) async {
    final portfoliosCollection = firebaseFirestore.collection('portfolios');
    try {
      await portfoliosCollection.doc(portfolio.id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> savePortfolio({required Portfolio portfolio}) async {
    final portfolios = firebaseFirestore.collection('portfolios');

    final portfolioModel = PortfolioModel(title: portfolio.title)
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    try {
      DocumentReference docRef = await portfolios.add(portfolioModel.toMap());
      portfolioModel.id = docRef.id;
      portfolioModel.userId = firebaseAuth.currentUser!.uid;
      await updatePortfolio(portfolio: portfolioModel);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updatePortfolio({required Portfolio portfolio}) async {
    final portfolios = firebaseFirestore.collection('portfolios');

    final portfolioModel = PortfolioModel(title: portfolio.title)
      ..id = portfolio.id
      ..userId = portfolio.userId
      ..createdAt = portfolio.createdAt
      ..updatedAt = DateTime.now();

    try {
      await portfolios.doc(portfolio.id).update(portfolioModel.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
