Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA114F52F9
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Apr 2022 05:50:46 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-rvwH6gC6PieKZU_BnmRiww-1; Tue, 05 Apr 2022 23:50:42 -0400
X-MC-Unique: rvwH6gC6PieKZU_BnmRiww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25B1D1C05B10;
	Wed,  6 Apr 2022 03:50:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 218C51121333;
	Wed,  6 Apr 2022 03:50:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D7AD0194036C;
	Wed,  6 Apr 2022 03:50:24 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD73919451F3 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 03:50:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A86BE404D91B; Wed,  6 Apr 2022 03:50:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3DB840CF8EF
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 03:50:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF3CB833959
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 03:50:22 +0000 (UTC)
Received: from u03.bc.larksuite.com (u03.bc.larksuite.com [130.44.212.37])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-uRysgTxQOse1XOQQFM-5zQ-3; Tue, 05 Apr 2022 23:50:19 -0400
X-MC-Unique: uRysgTxQOse1XOQQFM-5zQ-3
From: "Yue Hu" <huyue2@coolpad.com>
Message-Id: <20220406034952.31296-1-huyue2@coolpad.com>
Mime-Version: 1.0
To: <dhowells@redhat.com>, <marc.dionne@auristor.com>
Date: Wed, 06 Apr 2022 11:50:17 +0800
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] fscache: Remove the cookie parameter from
 fscache_clear_page_bits()
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
Cc: zbestahu@gmail.com, Yue Hu <huyue2@coolpad.com>,
 linux-kernel@vger.kernel.org, zhangwen@coolpad.com, linux-cachefs@redhat.com,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The cookie is not used at all, remove it and update the usage in io.c
and afs/write.c (which is the only user outside of fscache currently)
at the same time.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 fs/afs/write.c          | 3 +--
 fs/fscache/io.c         | 5 ++---
 include/linux/fscache.h | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 6bcf1475511b..4763132ca57e 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -616,8 +616,7 @@ static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
 		_debug("write discard %x @%llx [%llx]", len, start, i_size);
 
 		/* The dirty region was entirely beyond the EOF. */
-		fscache_clear_page_bits(afs_vnode_cache(vnode),
-					mapping, start, len, caching);
+		fscache_clear_page_bits(mapping, start, len, caching);
 		afs_pages_written_back(vnode, start, len);
 		ret = 0;
 	}
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index c8c7fe9e9a6e..3af3b08a9bb3 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -235,8 +235,7 @@ static void fscache_wreq_done(void *priv, ssize_t transferred_or_error,
 {
 	struct fscache_write_request *wreq = priv;
 
-	fscache_clear_page_bits(fscache_cres_cookie(&wreq->cache_resources),
-				wreq->mapping, wreq->start, wreq->len,
+	fscache_clear_page_bits(wreq->mapping, wreq->start, wreq->len,
 				wreq->set_bits);
 
 	if (wreq->term_func)
@@ -296,7 +295,7 @@ void __fscache_write_to_cache(struct fscache_cookie *cookie,
 abandon_free:
 	kfree(wreq);
 abandon:
-	fscache_clear_page_bits(cookie, mapping, start, len, cond);
+	fscache_clear_page_bits(mapping, start, len, cond);
 	if (term_func)
 		term_func(term_func_priv, ret, false);
 }
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 6727fb0db619..e25539072463 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -573,7 +573,6 @@ int fscache_write(struct netfs_cache_resources *cres,
 
 /**
  * fscache_clear_page_bits - Clear the PG_fscache bits from a set of pages
- * @cookie: The cookie representing the cache object
  * @mapping: The netfs inode to use as the source
  * @start: The start position in @mapping
  * @len: The amount of data to unlock
@@ -582,8 +581,7 @@ int fscache_write(struct netfs_cache_resources *cres,
  * Clear the PG_fscache flag from a sequence of pages and wake up anyone who's
  * waiting.
  */
-static inline void fscache_clear_page_bits(struct fscache_cookie *cookie,
-					   struct address_space *mapping,
+static inline void fscache_clear_page_bits(struct address_space *mapping,
 					   loff_t start, size_t len,
 					   bool caching)
 {
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

