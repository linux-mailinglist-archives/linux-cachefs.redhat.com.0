Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7EJ2KWAMGQE6C6GDEI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA182239D
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Jan 2024 22:49:49 +0100 (CET)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6800aa45af1sf117718326d6.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 02 Jan 2024 13:49:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704232188; cv=pass;
        d=google.com; s=arc-20160816;
        b=YevPer8GwzLs1qvWTjz+ZSYnO4ccbMO+mFPJziPV6JZJFEcfTy+TQWIEhdf1BRzK0a
         ay546dwb+aP2qau846kCHis58l7UdHn41vCY7WhUCDZwvckPGlEWS3Fgh/5rVn/i2vYm
         s4Cb2433DQCFcubjDiutiH+Qlmm/ABngPcsxGO/nOq0wPVWkbJKs3Q1XB6Wg4PaiUAkM
         +1NSUmKSaANuUMjzcRvr7TqjlF7u+qXT4ahEWydg2xquC+S78x+YoFRo6JXee3b35g/s
         bjJyDjFDEV5Y5qL0bhnLVAFHpOGf4qvecBdTiZUKtGZuMMKYd+8dRHliQwd2H/v7VIPo
         jqFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=ew3B1p+++a7egSjkxW8hnCgs7g43t3T3AblfkAAHiKc=;
        fh=bXx0gKTEiN0T4Oki33fWGQwtVMnj8qzLDmt7YPXEEB8=;
        b=XSnbStNkycHS/uMGRXIUrn8ou+spncD+CNDG/SN3KFlG8ba8z9k5cIBdX5/wt+m4a8
         ULlLIKyjeYZWg4Lcr2a94WiSLS4BYeZSoSh8Jt0Yr/X/FpHrA1CMYeITwOhy9hovG32G
         5zQyUbKVjr++jEnNh5AADwkE3AT87uJ3JllBPtUCG/n3566cMg7UktE66n07w3UHbJJv
         QlkmGHGaf1Si61DedGXpYogubcExIhc/LRkhqIcPzk/+01BLoO5Xa1XU1y6s9YeF0r5A
         c808FeqDBxhM22Ufb7xWuD3ShS8w8Wf7ZF0mqtL2lZkB/86aokmeUOE7wFHvYv/ljeVl
         Bxpg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232188; x=1704836988;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ew3B1p+++a7egSjkxW8hnCgs7g43t3T3AblfkAAHiKc=;
        b=t3m5OZxmhg+8Y3QyKnWeWBX6OEPkY8U/Pxx2dVizOB2sDr0S986XIQnIM3K5fShsf3
         Dp8DLWiB1qD1aA3pAuV4h7a8UVPq5b0SM1pEiMXqhiEsyhIwtgTbR8yq5Q3s/zuD5VWK
         7cCl7awxfM5EcOPJ2HPIAkK6JufOUuKU+N1wauHSm9ZNjELVu40lq96tddV8nlOBzydt
         bEIOAiaLCd7bqMpmPtGP3b/U9r1LQKPuLDwJu3eiZrAJaPGGpz98+9LeOoqmqQtF/5qS
         AvyxoW2V0P5O87D/l8gRyT5tJ8gJ1vsmcE0brMN135Qyp7dNXPaETBbtTycqmnRe2kMa
         T/tA==
X-Gm-Message-State: AOJu0Ywuyeg1Ei1XzM4yuGUyp4hVYBhRWjra7c2TB8JTyNEEFGNSA9MS
	usB8B/Bh6livdTankxyF2aRHTfjWfj+ITA==
X-Google-Smtp-Source: AGHT+IHYUXCcXCIzZdH9OXdg2Xq+0Jt+AMkGWuRAFIT5f8CjWYIArQvxK0Bi/D1sG/OQ0fYGouFwQw==
X-Received: by 2002:a05:6214:1d04:b0:67e:e8c5:6edd with SMTP id e4-20020a0562141d0400b0067ee8c56eddmr29381297qvd.39.1704232188599;
        Tue, 02 Jan 2024 13:49:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c65:0:b0:67f:744d:8b3e with SMTP id i5-20020ad45c65000000b0067f744d8b3els2899563qvh.1.-pod-prod-03-us;
 Tue, 02 Jan 2024 13:49:48 -0800 (PST)
X-Received: by 2002:a05:6214:2406:b0:67f:291a:b2a4 with SMTP id fv6-20020a056214240600b0067f291ab2a4mr27755911qvb.32.1704232188051;
        Tue, 02 Jan 2024 13:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704232188; cv=none;
        d=google.com; s=arc-20160816;
        b=ezQrCvOvF2XvnLeTzo46Tf66X6bgTm15hdHgbuqVUnJbDlosHzBfnQPr7vF7g9cViy
         ZhE+1Te3LrtZ39sSIYjtMtm3naBZUOqVCZvwYZUPq53+PbeIlzQHVq56uFfwrNHylY7P
         yQZie7LywQbbeioaYX+W8lMQzGHawQx4BuvRPWQyaNWtV+xc5jmpnOxkaY3Iyx6+z1LS
         ScW7Nbn/04ZrmdXfCrQcb71254l/8YDme65knEk+RlPHMci4x+hm2ZSdVQsEs+13ZM6f
         oLsD9Oa0p1Pu0Zfc7gO7sD7boeDAb/Ar0oxxu3sYTeQMTeyx5KL4qb+4NVF1W3RvnVpM
         fsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=+2Lg6AUuBdSoKwNZSR7zB9s5Ox3XMqjCdWX867hRfBM=;
        fh=bXx0gKTEiN0T4Oki33fWGQwtVMnj8qzLDmt7YPXEEB8=;
        b=KJloxD78EMrZJukv4VbkVsAfYCUVPDHLoRIE8ZW9wevar0DF8DE+bIVCCqpY2f8Mpp
         4kJYqGs/sGjI48grbiI11vkdb4D3GJWIFBkHQQFWjL3TQ4oMAhLI1sNV1G6gyLf2QRNs
         aOClR8oDDAC9c2xt64psUgbxgZ+6F6Cb+OK9ztNSmFS2tO5ifQ9yWXuAqHn2k3Tyj5uI
         0qA/UKJeHiR3L4wKEYMyKSgjNPYCClmkDx9wLel3hRFbj/MuSXCM66G9Q0H8zIAccyuI
         ZobUYT6XylshEpXIX4CDys4Wq6pmLQrJC6tSrzQDe6HYYUnNegshr/HMf79iaMOA76/P
         3JYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id b8-20020a0cc988000000b0067ed2267b72si27676229qvk.275.2024.01.02.13.49.47
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94--YiesrbJNVK0LOLxIg3N1g-1; Tue, 02 Jan 2024 16:49:43 -0500
X-MC-Unique: -YiesrbJNVK0LOLxIg3N1g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD7F086D4D8
	for <linux-cachefs@gapps.redhat.com>; Tue,  2 Jan 2024 21:49:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CA2CF492BF0; Tue,  2 Jan 2024 21:49:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9617D492BE6;
	Tue,  2 Jan 2024 21:49:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-41-dhowells@redhat.com>
References: <20231221132400.1601991-41-dhowells@redhat.com> <20231221132400.1601991-1-dhowells@redhat.com>
To: Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Latchesar Ionkov <lucho@ionkov.net>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: [PATCH] 9p: Fix initialisation of netfs_inode for 9p
MIME-Version: 1.0
Date: Tue, 02 Jan 2024 21:49:39 +0000
Message-ID: <292837.1704232179@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <292836.1704232179.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

This needs a fix that I would fold in.  Somehow it gets through xfstests
without it, but it seems problems can be caused with executables.

David
---
9p: Fix initialisation of netfs_inode for 9p

The 9p filesystem is calling netfs_inode_init() in v9fs_init_inode() -
before the struct inode fields have been initialised from the obtained file
stats (ie. after v9fs_stat2inode*() has been called), but netfslib wants to
set a couple of its fields from i_size.

Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Marc Dionne <marc.dionne@auristor.com>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: v9fs@lists.linux.dev
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
---
 fs/9p/v9fs_vfs.h       |    1 +
 fs/9p/vfs_inode.c      |    6 +++---
 fs/9p/vfs_inode_dotl.c |    1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/9p/v9fs_vfs.h b/fs/9p/v9fs_vfs.h
index 731e3d14b67d..0e8418066a48 100644
--- a/fs/9p/v9fs_vfs.h
+++ b/fs/9p/v9fs_vfs.h
@@ -42,6 +42,7 @@ struct inode *v9fs_alloc_inode(struct super_block *sb);
 void v9fs_free_inode(struct inode *inode);
 struct inode *v9fs_get_inode(struct super_block *sb, umode_t mode,
 			     dev_t rdev);
+void v9fs_set_netfs_context(struct inode *inode);
 int v9fs_init_inode(struct v9fs_session_info *v9ses,
 		    struct inode *inode, umode_t mode, dev_t rdev);
 void v9fs_evict_inode(struct inode *inode);
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index b66466e97459..32572982f72e 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -246,7 +246,7 @@ void v9fs_free_inode(struct inode *inode)
 /*
  * Set parameters for the netfs library
  */
-static void v9fs_set_netfs_context(struct inode *inode)
+void v9fs_set_netfs_context(struct inode *inode)
 {
 	struct v9fs_inode *v9inode = V9FS_I(inode);
 	netfs_inode_init(&v9inode->netfs, &v9fs_req_ops, true);
@@ -326,8 +326,6 @@ int v9fs_init_inode(struct v9fs_session_info *v9ses,
 		err = -EINVAL;
 		goto error;
 	}
-
-	v9fs_set_netfs_context(inode);
 error:
 	return err;
 
@@ -359,6 +357,7 @@ struct inode *v9fs_get_inode(struct super_block *sb, umode_t mode, dev_t rdev)
 		iput(inode);
 		return ERR_PTR(err);
 	}
+	v9fs_set_netfs_context(inode);
 	return inode;
 }
 
@@ -461,6 +460,7 @@ static struct inode *v9fs_qid_iget(struct super_block *sb,
 		goto error;
 
 	v9fs_stat2inode(st, inode, sb, 0);
+	v9fs_set_netfs_context(inode);
 	v9fs_cache_inode_get_cookie(inode);
 	unlock_new_inode(inode);
 	return inode;
diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index e25fbc988f09..3505227e1704 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -128,6 +128,7 @@ static struct inode *v9fs_qid_iget_dotl(struct super_block *sb,
 		goto error;
 
 	v9fs_stat2inode_dotl(st, inode, 0);
+	v9fs_set_netfs_context(inode);
 	v9fs_cache_inode_get_cookie(inode);
 	retval = v9fs_get_acl(inode, fid);
 	if (retval)

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

