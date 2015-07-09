{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.ECS.ListServices
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Lists the services that are running in a specified cluster.
--
-- <http://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListServices.html>
module Network.AWS.ECS.ListServices
    (
    -- * Request
      ListServices
    -- ** Request constructor
    , listServices
    -- ** Request lenses
    , lsCluster
    , lsNextToken
    , lsMaxResults

    -- * Response
    , ListServicesResponse
    -- ** Response constructor
    , listServicesResponse
    -- ** Response lenses
    , lsrServiceARNs
    , lsrNextToken
    , lsrStatus
    ) where

import           Network.AWS.ECS.Types
import           Network.AWS.Pager
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'listServices' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lsCluster'
--
-- * 'lsNextToken'
--
-- * 'lsMaxResults'
data ListServices = ListServices'
    { _lsCluster    :: !(Maybe Text)
    , _lsNextToken  :: !(Maybe Text)
    , _lsMaxResults :: !(Maybe Int)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ListServices' smart constructor.
listServices :: ListServices
listServices =
    ListServices'
    { _lsCluster = Nothing
    , _lsNextToken = Nothing
    , _lsMaxResults = Nothing
    }

-- | The short name or full Amazon Resource Name (ARN) of the cluster that
-- hosts the services you want to list. If you do not specify a cluster,
-- the default cluster is assumed..
lsCluster :: Lens' ListServices (Maybe Text)
lsCluster = lens _lsCluster (\ s a -> s{_lsCluster = a});

-- | The @nextToken@ value returned from a previous paginated @ListServices@
-- request where @maxResults@ was used and the results exceeded the value
-- of that parameter. Pagination continues from the end of the previous
-- results that returned the @nextToken@ value. This value is @null@ when
-- there are no more results to return.
lsNextToken :: Lens' ListServices (Maybe Text)
lsNextToken = lens _lsNextToken (\ s a -> s{_lsNextToken = a});

-- | The maximum number of container instance results returned by
-- @ListServices@ in paginated output. When this parameter is used,
-- @ListServices@ only returns @maxResults@ results in a single page along
-- with a @nextToken@ response element. The remaining results of the
-- initial request can be seen by sending another @ListServices@ request
-- with the returned @nextToken@ value. This value can be between 1 and
-- 100. If this parameter is not used, then @ListServices@ returns up to
-- 100 results and a @nextToken@ value if applicable.
lsMaxResults :: Lens' ListServices (Maybe Int)
lsMaxResults = lens _lsMaxResults (\ s a -> s{_lsMaxResults = a});

instance AWSPager ListServices where
        page rq rs
          | stop (rs ^. lsrNextToken) = Nothing
          | stop (rs ^. lsrServiceARNs) = Nothing
          | otherwise =
            Just $ rq & lsNextToken .~ rs ^. lsrNextToken

instance AWSRequest ListServices where
        type Sv ListServices = ECS
        type Rs ListServices = ListServicesResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 ListServicesResponse' <$>
                   (x .?> "serviceArns" .!@ mempty) <*>
                     (x .?> "nextToken")
                     <*> (pure (fromEnum s)))

instance ToHeaders ListServices where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonEC2ContainerServiceV20141113.ListServices" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ListServices where
        toJSON ListServices'{..}
          = object
              ["cluster" .= _lsCluster,
               "nextToken" .= _lsNextToken,
               "maxResults" .= _lsMaxResults]

instance ToPath ListServices where
        toPath = const "/"

instance ToQuery ListServices where
        toQuery = const mempty

-- | /See:/ 'listServicesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lsrServiceARNs'
--
-- * 'lsrNextToken'
--
-- * 'lsrStatus'
data ListServicesResponse = ListServicesResponse'
    { _lsrServiceARNs :: !(Maybe [Text])
    , _lsrNextToken   :: !(Maybe Text)
    , _lsrStatus      :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ListServicesResponse' smart constructor.
listServicesResponse :: Int -> ListServicesResponse
listServicesResponse pStatus =
    ListServicesResponse'
    { _lsrServiceARNs = Nothing
    , _lsrNextToken = Nothing
    , _lsrStatus = pStatus
    }

-- | The list of full Amazon Resource Name (ARN) entries for each service
-- associated with the specified cluster.
lsrServiceARNs :: Lens' ListServicesResponse [Text]
lsrServiceARNs = lens _lsrServiceARNs (\ s a -> s{_lsrServiceARNs = a}) . _Default;

-- | The @nextToken@ value to include in a future @ListServices@ request.
-- When the results of a @ListServices@ request exceed @maxResults@, this
-- value can be used to retrieve the next page of results. This value is
-- @null@ when there are no more results to return.
lsrNextToken :: Lens' ListServicesResponse (Maybe Text)
lsrNextToken = lens _lsrNextToken (\ s a -> s{_lsrNextToken = a});

-- | FIXME: Undocumented member.
lsrStatus :: Lens' ListServicesResponse Int
lsrStatus = lens _lsrStatus (\ s a -> s{_lsrStatus = a});
