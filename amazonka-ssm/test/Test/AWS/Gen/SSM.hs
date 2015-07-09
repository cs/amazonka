{-# OPTIONS_GHC -fno-warn-orphans #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Test.AWS.Gen.SSM
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
module Test.AWS.Gen.SSM where

import Data.Proxy
import Test.AWS.Fixture
import Test.AWS.Prelude
import Test.Tasty
import Network.AWS.SSM

-- Auto-generated: the actual test selection needs to be manually placed into
-- the top-level so that real test data can be incrementally added.
--
-- This commented snippet is what the entire set should look like:

-- fixtures :: TestTree
-- fixtures =
--     [ testGroup "request"
--         [ testDescribeDocument $
--             describeDocument
--
--         , testCreateAssociation $
--             createAssociation
--
--         , testCreateDocument $
--             createDocument
--
--         , testListDocuments $
--             listDocuments
--
--         , testGetDocument $
--             getDocument
--
--         , testDescribeAssociation $
--             describeAssociation
--
--         , testUpdateAssociationStatus $
--             updateAssociationStatus
--
--         , testDeleteAssociation $
--             deleteAssociation
--
--         , testListAssociations $
--             listAssociations
--
--         , testDeleteDocument $
--             deleteDocument
--
--         , testCreateAssociationBatch $
--             createAssociationBatch
--
--           ]

--     , testGroup "response"
--         [ testDescribeDocumentResponse $
--             describeDocumentResponse
--
--         , testCreateAssociationResponse $
--             createAssociationResponse
--
--         , testCreateDocumentResponse $
--             createDocumentResponse
--
--         , testListDocumentsResponse $
--             listDocumentsResponse
--
--         , testGetDocumentResponse $
--             getDocumentResponse
--
--         , testDescribeAssociationResponse $
--             describeAssociationResponse
--
--         , testUpdateAssociationStatusResponse $
--             updateAssociationStatusResponse
--
--         , testDeleteAssociationResponse $
--             deleteAssociationResponse
--
--         , testListAssociationsResponse $
--             listAssociationsResponse
--
--         , testDeleteDocumentResponse $
--             deleteDocumentResponse
--
--         , testCreateAssociationBatchResponse $
--             createAssociationBatchResponse
--
--           ]
--     ]

-- Requests

testDescribeDocument :: DescribeDocument -> TestTree
testDescribeDocument = undefined

testCreateAssociation :: CreateAssociation -> TestTree
testCreateAssociation = undefined

testCreateDocument :: CreateDocument -> TestTree
testCreateDocument = undefined

testListDocuments :: ListDocuments -> TestTree
testListDocuments = undefined

testGetDocument :: GetDocument -> TestTree
testGetDocument = undefined

testDescribeAssociation :: DescribeAssociation -> TestTree
testDescribeAssociation = undefined

testUpdateAssociationStatus :: UpdateAssociationStatus -> TestTree
testUpdateAssociationStatus = undefined

testDeleteAssociation :: DeleteAssociation -> TestTree
testDeleteAssociation = undefined

testListAssociations :: ListAssociations -> TestTree
testListAssociations = undefined

testDeleteDocument :: DeleteDocument -> TestTree
testDeleteDocument = undefined

testCreateAssociationBatch :: CreateAssociationBatch -> TestTree
testCreateAssociationBatch = undefined

-- Responses

testDescribeDocumentResponse :: DescribeDocumentResponse -> TestTree
testDescribeDocumentResponse = resp
    "DescribeDocumentResponse"
    "fixture/DescribeDocumentResponse"
    (Proxy :: Proxy DescribeDocument)

testCreateAssociationResponse :: CreateAssociationResponse -> TestTree
testCreateAssociationResponse = resp
    "CreateAssociationResponse"
    "fixture/CreateAssociationResponse"
    (Proxy :: Proxy CreateAssociation)

testCreateDocumentResponse :: CreateDocumentResponse -> TestTree
testCreateDocumentResponse = resp
    "CreateDocumentResponse"
    "fixture/CreateDocumentResponse"
    (Proxy :: Proxy CreateDocument)

testListDocumentsResponse :: ListDocumentsResponse -> TestTree
testListDocumentsResponse = resp
    "ListDocumentsResponse"
    "fixture/ListDocumentsResponse"
    (Proxy :: Proxy ListDocuments)

testGetDocumentResponse :: GetDocumentResponse -> TestTree
testGetDocumentResponse = resp
    "GetDocumentResponse"
    "fixture/GetDocumentResponse"
    (Proxy :: Proxy GetDocument)

testDescribeAssociationResponse :: DescribeAssociationResponse -> TestTree
testDescribeAssociationResponse = resp
    "DescribeAssociationResponse"
    "fixture/DescribeAssociationResponse"
    (Proxy :: Proxy DescribeAssociation)

testUpdateAssociationStatusResponse :: UpdateAssociationStatusResponse -> TestTree
testUpdateAssociationStatusResponse = resp
    "UpdateAssociationStatusResponse"
    "fixture/UpdateAssociationStatusResponse"
    (Proxy :: Proxy UpdateAssociationStatus)

testDeleteAssociationResponse :: DeleteAssociationResponse -> TestTree
testDeleteAssociationResponse = resp
    "DeleteAssociationResponse"
    "fixture/DeleteAssociationResponse"
    (Proxy :: Proxy DeleteAssociation)

testListAssociationsResponse :: ListAssociationsResponse -> TestTree
testListAssociationsResponse = resp
    "ListAssociationsResponse"
    "fixture/ListAssociationsResponse"
    (Proxy :: Proxy ListAssociations)

testDeleteDocumentResponse :: DeleteDocumentResponse -> TestTree
testDeleteDocumentResponse = resp
    "DeleteDocumentResponse"
    "fixture/DeleteDocumentResponse"
    (Proxy :: Proxy DeleteDocument)

testCreateAssociationBatchResponse :: CreateAssociationBatchResponse -> TestTree
testCreateAssociationBatchResponse = resp
    "CreateAssociationBatchResponse"
    "fixture/CreateAssociationBatchResponse"
    (Proxy :: Proxy CreateAssociationBatch)

instance Out Association
instance Out AssociationDescription
instance Out AssociationFilter
instance Out AssociationFilterKey
instance Out AssociationStatus
instance Out AssociationStatusName
instance Out CreateAssociation
instance Out CreateAssociationBatch
instance Out CreateAssociationBatchRequestEntry
instance Out CreateAssociationBatchResponse
instance Out CreateAssociationResponse
instance Out CreateDocument
instance Out CreateDocumentResponse
instance Out DeleteAssociation
instance Out DeleteAssociationResponse
instance Out DeleteDocument
instance Out DeleteDocumentResponse
instance Out DescribeAssociation
instance Out DescribeAssociationResponse
instance Out DescribeDocument
instance Out DescribeDocumentResponse
instance Out DocumentDescription
instance Out DocumentFilter
instance Out DocumentFilterKey
instance Out DocumentIdentifier
instance Out DocumentStatus
instance Out FailedCreateAssociation
instance Out Fault
instance Out GetDocument
instance Out GetDocumentResponse
instance Out ListAssociations
instance Out ListAssociationsResponse
instance Out ListDocuments
instance Out ListDocumentsResponse
instance Out UpdateAssociationStatus
instance Out UpdateAssociationStatusResponse
