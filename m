Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB69566179
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Jul 2022 04:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656989591;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h4JWysfAPMkJxO0etY2vVfY+iCSx54gFq2/JuCIIb0c=;
	b=Z00khHhGQiARZyDDBoTYRBixcMek0shBNgyDuJ8t8PCLWHGz2anqrTlU/IOKrP8L80e/gJ
	/8IqewDr/7xToc4jmJE+tz831MnosXQCuZBSaVKpe6zLQs83k5ouASKcZlvEsBn+p4aImi
	uNKTget4LP+x0r7iNnJ4/3YOBq3RX6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-tq7R98bFPuGe96sY4K6k3g-1; Mon, 04 Jul 2022 22:53:08 -0400
X-MC-Unique: tq7R98bFPuGe96sY4K6k3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E950101A589;
	Tue,  5 Jul 2022 02:53:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4081840218D3;
	Tue,  5 Jul 2022 02:53:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11ABC1947052;
	Tue,  5 Jul 2022 02:53:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 42A051947041 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Jul 2022 02:53:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C089492CA5; Tue,  5 Jul 2022 02:53:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from lxbceph1.gsslab.pek2.redhat.com (unknown [10.72.47.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48E33492C3B;
 Tue,  5 Jul 2022 02:53:02 +0000 (UTC)
From: xiubli@redhat.com
To: dhowells@redhat.com
Date: Tue,  5 Jul 2022 10:52:54 +0800
Message-Id: <20220705025255.331695-2-xiubli@redhat.com>
In-Reply-To: <20220705025255.331695-1-xiubli@redhat.com>
References: <20220705025255.331695-1-xiubli@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH v2 1/2] netfs: do not unlock and put the
 folio twice
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 marc.dionne@auristor.com, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xiubo Li <xiubli@redhat.com>

check_write_begin() will unlock and put the folio when return
non-zero. So we should avoid unlocking and putting it twice in
netfs layer.

URL: https://tracker.ceph.com/issues/56423
Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 fs/netfs/buffered_read.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 42f892c5712e..b6fd6e5fe019 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -320,7 +320,7 @@ static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
  * pointer to the fsdata cookie that gets returned to the VM to be passed to
  * write_end.  It is permitted to sleep.  It should return 0 if the request
  * should go ahead; unlock the folio and return -EAGAIN to cause the folio to
- * be regot; or return an error.
+ * be regot; or unlock the folio and return an error.
  *
  * The calling netfs must initialise a netfs context contiguous to the vfs
  * inode before calling this.
@@ -353,7 +353,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
 			if (ret == -EAGAIN)
 				goto retry;
-			goto error;
+			goto error_unlocked;
 		}
 	}
 
@@ -375,7 +375,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 				   NETFS_READ_FOR_WRITE);
 	if (IS_ERR(rreq)) {
 		ret = PTR_ERR(rreq);
-		goto error;
+		goto error_locked;
 	}
 	rreq->no_unlock_folio	= folio_index(folio);
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
@@ -402,12 +402,12 @@ int netfs_write_begin(struct netfs_inode *ctx,
 
 	ret = netfs_begin_read(rreq, true);
 	if (ret < 0)
-		goto error;
+		goto error_locked;
 
 have_folio:
 	ret = folio_wait_fscache_killable(folio);
 	if (ret < 0)
-		goto error;
+		goto error_locked;
 have_folio_no_wait:
 	*_folio = folio;
 	_leave(" = 0");
@@ -415,9 +415,10 @@ int netfs_write_begin(struct netfs_inode *ctx,
 
 error_put:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
-error:
+error_locked:
 	folio_unlock(folio);
 	folio_put(folio);
+error_unlocked:
 	_leave(" = %d", ret);
 	return ret;
 }
-- 
2.36.0.rc1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

