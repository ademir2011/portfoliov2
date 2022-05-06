import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/external/firebase_portfolio_datasource.dart';

class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}

class CollectionReferenceMock extends Mock implements CollectionReference<Map<String, dynamic>> {}

class DocumentReferenceMock extends Mock implements DocumentReference<Map<String, dynamic>> {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

void main() {
  test('Deve receber uma lista de portfolios', () async {
    final firebaseFirestoreMock = FirebaseFirestoreMock();

    final firebasePortfolioDatasource =
        FirebasePortfolioDatasource(firebaseFirestore: firebaseFirestoreMock, firebaseAuth: FirebaseAuthMock());

    final portfolios = await firebasePortfolioDatasource.fetchPortfolios();
    expect(portfolios, isA<List<Portfolio>>());
  });

  test('Deve salver um portfolio', () async {
    final firebaseFirestoreMock = FirebaseFirestoreMock();
    final collectionReferenceMock = CollectionReferenceMock();
    final documentReferenceMock = DocumentReferenceMock();
    when(() => firebaseFirestoreMock.collection(any())).thenReturn(collectionReferenceMock);
    when(() => collectionReferenceMock.add(any())).thenAnswer((_) async => Future.value(documentReferenceMock));

    final firebasePortfolioDatasource =
        FirebasePortfolioDatasource(firebaseFirestore: firebaseFirestoreMock, firebaseAuth: FirebaseAuthMock());

    expect(firebasePortfolioDatasource.savePortfolio(portfolio: Portfolio(title: '')), isA<Future<void>>());
  });
}
