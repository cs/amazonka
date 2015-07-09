{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CloudHSM.DeleteHSM
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Deletes an HSM. Once complete, this operation cannot be undone and your
-- key material cannot be recovered.
--
-- <http://docs.aws.amazon.com/cloudhsm/latest/dg/API_DeleteHSM.html>
module Network.AWS.CloudHSM.DeleteHSM
    (
    -- * Request
      DeleteHSM
    -- ** Request constructor
    , deleteHSM
    -- ** Request lenses
    , dhHSMARN

    -- * Response
    , DeleteHSMResponse
    -- ** Response constructor
    , deleteHSMResponse
    -- ** Response lenses
    , delStatus
    ) where

import           Network.AWS.CloudHSM.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the inputs for the DeleteHsm action.
--
-- /See:/ 'deleteHSM' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dhHSMARN'
newtype DeleteHSM = DeleteHSM'
    { _dhHSMARN :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteHSM' smart constructor.
deleteHSM :: Text -> DeleteHSM
deleteHSM pHSMARN =
    DeleteHSM'
    { _dhHSMARN = pHSMARN
    }

-- | The ARN of the HSM to delete.
dhHSMARN :: Lens' DeleteHSM Text
dhHSMARN = lens _dhHSMARN (\ s a -> s{_dhHSMARN = a});

instance AWSRequest DeleteHSM where
        type Sv DeleteHSM = CloudHSM
        type Rs DeleteHSM = DeleteHSMResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DeleteHSMResponse' <$> (pure (fromEnum s)))

instance ToHeaders DeleteHSM where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("CloudHsmFrontendService.DeleteHSM" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteHSM where
        toJSON DeleteHSM'{..}
          = object ["HsmArn" .= _dhHSMARN]

instance ToPath DeleteHSM where
        toPath = const "/"

instance ToQuery DeleteHSM where
        toQuery = const mempty

-- | Contains the output of the DeleteHsm action.
--
-- /See:/ 'deleteHSMResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'delStatus'
newtype DeleteHSMResponse = DeleteHSMResponse'
    { _delStatus :: Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteHSMResponse' smart constructor.
deleteHSMResponse :: Int -> DeleteHSMResponse
deleteHSMResponse pStatus =
    DeleteHSMResponse'
    { _delStatus = pStatus
    }

-- | FIXME: Undocumented member.
delStatus :: Lens' DeleteHSMResponse Int
delStatus = lens _delStatus (\ s a -> s{_delStatus = a});
