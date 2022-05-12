Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D25248A7
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 May 2022 11:12:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-t73Rng0EO5-x51pGIYrp8Q-1; Thu, 12 May 2022 05:12:46 -0400
X-MC-Unique: t73Rng0EO5-x51pGIYrp8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4E4429DD9AB;
	Thu, 12 May 2022 09:12:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EFC7C27D90;
	Thu, 12 May 2022 09:12:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E71B1932210;
	Thu, 12 May 2022 09:12:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B3DE194F4BB for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 12 May 2022 09:12:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29A722166B26; Thu, 12 May 2022 09:12:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23E1F2166B40
 for <linux-cachefs@redhat.com>; Thu, 12 May 2022 09:12:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B864D1C0518C
 for <linux-cachefs@redhat.com>; Thu, 12 May 2022 09:12:37 +0000 (UTC)
Received: from u05.bc.larksuite.com (u05.bc.larksuite.com [130.44.212.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-inXEDnKqPj2P9FBuIZLijA-3; Thu, 12 May 2022 05:12:33 -0400
X-MC-Unique: inXEDnKqPj2P9FBuIZLijA-3
From: "Yue Hu" <huyue2@coolpad.com>
Message-Id: <20220512091153.12176-1-huyue2@coolpad.com>
To: <dhowells@redhat.com>, <linux-cachefs@redhat.com>
Date: Thu, 12 May 2022 17:12:31 +0800
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2627ccf7f+5a9358+redhat.com+huyue2@coolpad.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] fscache: Do not check operations validity
 to fscache_{read, write}()
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
Cc: zbestahu@gmail.com, huyue2@coolpad.com, linux-kernel@vger.kernel.org,
 zhangwen@coolpad.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Note that fscache_operation_valid() may return NULL, but we do not care
about it, that is to say the validity checking is needless.

Actually, there's a call to fscache_begin_operation() beforehand, which
will make sure the resources are usable for the subsequent operations.
And we have already called ops->prepare_write() before fscache_write().

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 include/linux/fscache.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 72585c9729a2..8045497c6515 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -510,9 +510,8 @@ int fscache_read(struct netfs_cache_resources *cres,
 		 netfs_io_terminated_t term_func,
 		 void *term_func_priv)
 {
-	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
-	return ops->read(cres, start_pos, iter, read_hole,
-			 term_func, term_func_priv);
+	return cres->ops->read(cres, start_pos, iter, read_hole, term_func,
+			       term_func_priv);
 }
 
 /**
@@ -568,8 +567,8 @@ int fscache_write(struct netfs_cache_resources *cres,
 		  netfs_io_terminated_t term_func,
 		  void *term_func_priv)
 {
-	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
-	return ops->write(cres, start_pos, iter, term_func, term_func_priv);
+	return cres->ops->write(cres, start_pos, iter, term_func,
+				term_func_priv);
 }
 
 /**
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

