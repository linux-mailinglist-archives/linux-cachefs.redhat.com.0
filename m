Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4HM2WWAMGQE654R2QQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE9822FFE
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 16:00:01 +0100 (CET)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5f1df517cf3sf39100177b3.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 07:00:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704294001; cv=pass;
        d=google.com; s=arc-20160816;
        b=0X1YFfiN0XEOt4n5JRwRsH/AJBt68Q4bFCZqt5KoQCuWnxCg95r26CbrhwfTsXxjDf
         5XbRpOE9HZmsD1Cjx4hqGjjuk4V28z9VMriDkWj+K3/AgKINwLrU18Hl6kKee6lVUWmG
         NmYQ5X7dGKuh6bVtZ3bqtsClf/2ZQCNBHZSl+j7hbbgy/enIOJek3wGX+5lpydVfYszt
         A/Ln7BHc9IZOvxuIEWoNS6k6aKkDxKmmfKoIBAKlWaKAMTZ+xTbfT8hHGvWXwLzHCEK/
         j50rulcynfL+2ClzZFvgkM95Egr3Mots7tg3W9nV1GKAG0YT/7skEpnLrChRhxiYXIvh
         fPDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=C5u1QxdNDLZb+D3aaqOiHy8BuEW6PKMlFHNUHHjXqEs=;
        fh=z2lFNIQm1BYTiGQWz0rp4lP3BVSA1n5g+uZ/88gyKRg=;
        b=hSuD+wgUx+5O7OeF6rJxlqXvqiYOdHfzJy+5R8Bdw4AqOFT8PguW/zFDRLRF2FRNkT
         YGOZlkEHrZib1wLdtNE47hfmKA6CzyQPL4w2+W13nTlTsIOuf4+KUP28SKu2UgmzAygU
         dmuMSFsG0JsP7e+xzIcVmmNJ6pjZ1LWPfUnPodEr+NH6qAtBW3HECW+1Q1/cKZLf6ocd
         z41y8nn8vVicTcSaevP+55U1sA6r/HSOJaJ5xGfr8kf/U2beSlcH9NQPElxWRUkfVcOF
         2oXdojCcHHHK/nSNTkJdoHrnoPnE8H40Ugd5NJoCbdnSxpcU//Qn0Tq5MfYEaMXcGNNu
         WU8Q==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704294001; x=1704898801;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5u1QxdNDLZb+D3aaqOiHy8BuEW6PKMlFHNUHHjXqEs=;
        b=By3ng9AWGNCD4VS13seFHnHbf30tSImDTGKesV87OSIBHu7zZWw7Wz9vxOOxPKrj3q
         khIDSuWWQRWpWHghbKT4ppM7ikYbyXvP3mOCa3+WV0K7KJS1BRmCL44EXUkVgOvFuNyt
         I0FAGAD0Tvo9TvVKA3NI1TjSPh7t3YUJsSpAvJkTKe+/pa87Acbt7n/S03Vch/3OD3MF
         729aNfuzGt23KX2e/l9L4jFvhd+IGLSVvbd8wIDq1P/o7BRmKTp0tg5HluplHivsad73
         QhnG8/cc6I23rdZysLub5QJn66PrvSugdeUo6Yui4BcED6YTw93jZSgtFZd4aVVtGDq4
         UDew==
X-Gm-Message-State: AOJu0YwZvpm3Rm1bCtTz6rYJ2MGjZFa22I0Udx+NTeY6EqbQdXa2fbmy
	NyarEqXv0jnnS2fkJyxJb4rDlarhvheRYg==
X-Google-Smtp-Source: AGHT+IGZP5y6qAd+8o44AlD09sq4YMNECk24P3dUHQkGru0PD4MJVZ4y6VAl2Ta+5qHvhss8QQ092w==
X-Received: by 2002:a0d:db49:0:b0:5e7:6aa0:b44a with SMTP id d70-20020a0ddb49000000b005e76aa0b44amr12598963ywe.52.1704294000967;
        Wed, 03 Jan 2024 07:00:00 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:43e9:0:b0:680:48fd:c706 with SMTP id f9-20020ad443e9000000b0068048fdc706ls1910374qvu.2.-pod-prod-04-us;
 Wed, 03 Jan 2024 07:00:00 -0800 (PST)
X-Received: by 2002:a05:6122:4d01:b0:4b7:8199:5d17 with SMTP id fi1-20020a0561224d0100b004b781995d17mr3031171vkb.25.1704294000438;
        Wed, 03 Jan 2024 07:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704294000; cv=none;
        d=google.com; s=arc-20160816;
        b=wiH6ohjhbrg4WS82Db64NBhZ5KlaITzpHAwtzm/nKWLHwyNVKMddEYMzb7m+Ag0v3g
         /xXApbMQ+u5B3IJGjtbgHbIZETmSQwwLVmSvzWg/QafDeAjRjaPtEmY/1Zl4Csgzq1gx
         g2qedGdRkksvM2uCSsVUDfNB8HC1nyKQIzW4sUx2NVO/m2TwkMwWh0qQy4C2tZ2xcEJI
         oae+GQgSW4UXNpbeOxgWDna9SloYyGru3mkqmMigScVtm/zh5nAzkEwHyrfUSgwldy9P
         kjTptyJvULKbTu7EI7O7aq74SZuBGJB+1Peo2lmmQX7E3TPyTYAhhFwxdmUKd+bN4q5B
         OQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=MeAO0oSTBeeKS0vYZcWZAv5QaziKwPxfd8eozSQVml8=;
        fh=z2lFNIQm1BYTiGQWz0rp4lP3BVSA1n5g+uZ/88gyKRg=;
        b=DPeW5D6PJvp8FlJZ5gQ0x5aHt/mTPn5ETmh76V3kv3rcmEV4iYvBBQBnjuaRvuyFQn
         hVpeiJ8CJYgF0T027+O+um+DYTqL1SJ+xhNaefjHvEgpcF1Vs4KGf/mLpOkiu7IZMWll
         aFI4NcPeXvUGSJXgK9JiL5FLufd67adcfeuFevWHAmlA48DmQP0UbtRad3a0Y7q1LyK6
         tY5plgZODzPCutfc1gzG8H7bQwwdNJBANIvcCUxL0R/vlO7Bd8NLPvrxbULVHd5xYLyC
         XWgWeVWa0jauv0AW3uGKg+g+VmkqS0c4bz6p8OCRffTAzyRBj3YEFz3Tu91AQZnWHOUF
         COOw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id w30-20020a05620a0e9e00b00781935ddd47si10779160qkm.402.2024.01.03.07.00.00
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:00:00 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-2zpllvnxMNGDHrkbhd5bjw-1; Wed,
 03 Jan 2024 09:59:58 -0500
X-MC-Unique: 2zpllvnxMNGDHrkbhd5bjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D6783806063
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 14:59:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 9A4A23C25; Wed,  3 Jan 2024 14:59:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03EE83C30;
	Wed,  3 Jan 2024 14:59:53 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: [PATCH 2/5] 9p: Fix initialisation of netfs_inode for 9p
Date: Wed,  3 Jan 2024 14:59:26 +0000
Message-ID: <20240103145935.384404-3-dhowells@redhat.com>
In-Reply-To: <20240103145935.384404-1-dhowells@redhat.com>
References: <20240103145935.384404-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

The 9p filesystem is calling netfs_inode_init() in v9fs_init_inode() -
before the struct inode fields have been initialised from the obtained file
stats (ie. after v9fs_stat2inode*() has been called), but netfslib wants to
set a couple of its fields from i_size.

Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Marc Dionne <marc.dionne@auristor.com>
Tested-by: Dominique Martinet <asmadeus@codewreck.org>
Acked-by: Dominique Martinet <asmadeus@codewreck.org>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: v9fs@lists.linux.dev
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
---
 fs/9p/v9fs_vfs.h       | 1 +
 fs/9p/vfs_inode.c      | 6 +++---
 fs/9p/vfs_inode_dotl.c | 1 +
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

