{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CloudSearch.DefineAnalysisScheme
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Configures an analysis scheme that can be applied to a @text@ or
-- @text-array@ field to define language-specific text processing options.
-- For more information, see
-- <http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html Configuring Analysis Schemes>
-- in the /Amazon CloudSearch Developer Guide/.
--
-- <http://docs.aws.amazon.com/cloudsearch/latest/developerguide/API_DefineAnalysisScheme.html>
module Network.AWS.CloudSearch.DefineAnalysisScheme
    (
    -- * Request
      DefineAnalysisScheme
    -- ** Request constructor
    , defineAnalysisScheme
    -- ** Request lenses
    , defiDomainName
    , defiAnalysisScheme

    -- * Response
    , DefineAnalysisSchemeResponse
    -- ** Response constructor
    , defineAnalysisSchemeResponse
    -- ** Response lenses
    , dasr1Status
    , dasr1AnalysisScheme
    ) where

import           Network.AWS.CloudSearch.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Container for the parameters to the @DefineAnalysisScheme@ operation.
-- Specifies the name of the domain you want to update and the analysis
-- scheme configuration.
--
-- /See:/ 'defineAnalysisScheme' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'defiDomainName'
--
-- * 'defiAnalysisScheme'
data DefineAnalysisScheme = DefineAnalysisScheme'
    { _defiDomainName     :: !Text
    , _defiAnalysisScheme :: !AnalysisScheme
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DefineAnalysisScheme' smart constructor.
defineAnalysisScheme :: Text -> AnalysisScheme -> DefineAnalysisScheme
defineAnalysisScheme pDomainName pAnalysisScheme =
    DefineAnalysisScheme'
    { _defiDomainName = pDomainName
    , _defiAnalysisScheme = pAnalysisScheme
    }

-- | FIXME: Undocumented member.
defiDomainName :: Lens' DefineAnalysisScheme Text
defiDomainName = lens _defiDomainName (\ s a -> s{_defiDomainName = a});

-- | FIXME: Undocumented member.
defiAnalysisScheme :: Lens' DefineAnalysisScheme AnalysisScheme
defiAnalysisScheme = lens _defiAnalysisScheme (\ s a -> s{_defiAnalysisScheme = a});

instance AWSRequest DefineAnalysisScheme where
        type Sv DefineAnalysisScheme = CloudSearch
        type Rs DefineAnalysisScheme =
             DefineAnalysisSchemeResponse
        request = post
        response
          = receiveXMLWrapper "DefineAnalysisSchemeResult"
              (\ s h x ->
                 DefineAnalysisSchemeResponse' <$>
                   (pure (fromEnum s)) <*> (x .@ "AnalysisScheme"))

instance ToHeaders DefineAnalysisScheme where
        toHeaders = const mempty

instance ToPath DefineAnalysisScheme where
        toPath = const "/"

instance ToQuery DefineAnalysisScheme where
        toQuery DefineAnalysisScheme'{..}
          = mconcat
              ["Action" =: ("DefineAnalysisScheme" :: ByteString),
               "Version" =: ("2013-01-01" :: ByteString),
               "DomainName" =: _defiDomainName,
               "AnalysisScheme" =: _defiAnalysisScheme]

-- | The result of a @DefineAnalysisScheme@ request. Contains the status of
-- the newly-configured analysis scheme.
--
-- /See:/ 'defineAnalysisSchemeResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dasr1Status'
--
-- * 'dasr1AnalysisScheme'
data DefineAnalysisSchemeResponse = DefineAnalysisSchemeResponse'
    { _dasr1Status         :: !Int
    , _dasr1AnalysisScheme :: !AnalysisSchemeStatus
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DefineAnalysisSchemeResponse' smart constructor.
defineAnalysisSchemeResponse :: Int -> AnalysisSchemeStatus -> DefineAnalysisSchemeResponse
defineAnalysisSchemeResponse pStatus pAnalysisScheme =
    DefineAnalysisSchemeResponse'
    { _dasr1Status = pStatus
    , _dasr1AnalysisScheme = pAnalysisScheme
    }

-- | FIXME: Undocumented member.
dasr1Status :: Lens' DefineAnalysisSchemeResponse Int
dasr1Status = lens _dasr1Status (\ s a -> s{_dasr1Status = a});

-- | FIXME: Undocumented member.
dasr1AnalysisScheme :: Lens' DefineAnalysisSchemeResponse AnalysisSchemeStatus
dasr1AnalysisScheme = lens _dasr1AnalysisScheme (\ s a -> s{_dasr1AnalysisScheme = a});
