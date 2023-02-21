Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6349469DDF0
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Feb 2023 11:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676975607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0EAI6lm/BjTK246HAFWfU5FrZzoqarTDlnvDdD+ck+g=;
	b=GsjG16mURlCHXHPMpPZpGiUT8ngOqBNcRglMpN3uQtpsu45bVS4MyAnMGum7g14HmNq0l+
	Q4zzVe7lpwN2iLt+XPNYAJbEkh5oa2cP3OibfonJuq8AtowOonUmGI6tEJDV+zovBvzgXE
	x52EXKZJ0Y2jCWW7VjzI6uSZnw/lShg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-QJnj4EEWO8umAhFj_4OhEg-1; Tue, 21 Feb 2023 05:33:24 -0500
X-MC-Unique: QJnj4EEWO8umAhFj_4OhEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADCD4380670A;
	Tue, 21 Feb 2023 10:33:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4E912166B26;
	Tue, 21 Feb 2023 10:33:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C8CB194658C;
	Tue, 21 Feb 2023 10:33:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B3A0E1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 21 Feb 2023 10:33:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A78952166B29; Tue, 21 Feb 2023 10:33:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A12042166B26
 for <linux-cachefs@redhat.com>; Tue, 21 Feb 2023 10:33:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82F8C80D181
 for <linux-cachefs@redhat.com>; Tue, 21 Feb 2023 10:33:22 +0000 (UTC)
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-248-Q1x7OsoAMm2mjan4VecpHA-1; Tue, 21 Feb 2023 05:33:20 -0500
X-MC-Unique: Q1x7OsoAMm2mjan4VecpHA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VcC7r-U_1676975595
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VcC7r-U_1676975595) by smtp.aliyun-inc.com;
 Tue, 21 Feb 2023 18:33:15 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue, 21 Feb 2023 18:33:13 +0800
Message-Id: <20230221103313.120834-3-jefflexu@linux.alibaba.com>
In-Reply-To: <20230221103313.120834-1-jefflexu@linux.alibaba.com>
References: <20230221103313.120834-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH 2/2] fscache: introduce
 fscache_begin_wait_operation() helper
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a variant of fscache_wait_for_operation() except that it's
exported for users of FsCache, and thus cookie->lock is held when
checking cookie's state.

Exporting fscache_begin_operation() directly is not acceptable as it
would introduce dependency of <trace/events/fscache.h> for users of
FsCache.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/fscache/io.c         |  9 +++++++++
 include/linux/fscache.h | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 0d2b8dec8f82..6ccc5aadf151 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -158,6 +158,15 @@ int __fscache_begin_write_operation(struct netfs_cache_resources *cres,
 }
 EXPORT_SYMBOL(__fscache_begin_write_operation);
 
+int __fscache_begin_wait_operation(struct netfs_cache_resources *cres,
+				   struct fscache_cookie *cookie,
+				   enum fscache_want_state want_state)
+{
+	return fscache_begin_operation(cres, cookie, want_state,
+				       fscache_access_io_wait);
+}
+EXPORT_SYMBOL(__fscache_begin_wait_operation);
+
 /**
  * fscache_dirty_folio - Mark folio dirty and pin a cache object for writeback
  * @mapping: The mapping the folio belongs to.
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 8e312c8323a8..708cf8db7f46 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -171,6 +171,8 @@ extern void __fscache_resize_cookie(struct fscache_cookie *, loff_t);
 extern void __fscache_invalidate(struct fscache_cookie *, const void *, loff_t, unsigned int);
 extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct fscache_cookie *);
 extern int __fscache_begin_write_operation(struct netfs_cache_resources *, struct fscache_cookie *);
+extern int __fscache_begin_wait_operation(struct netfs_cache_resources *, struct fscache_cookie *,
+					  enum fscache_want_state want_state);
 
 extern void __fscache_write_to_cache(struct fscache_cookie *, struct address_space *,
 				     loff_t, size_t, loff_t, netfs_io_terminated_t, void *,
@@ -543,6 +545,26 @@ int fscache_begin_write_operation(struct netfs_cache_resources *cres,
 	return -ENOBUFS;
 }
 
+/**
+ * fscache_begin_wait_operation - Wait for an object become accessible
+ * @cres: The cache resources for the operation being performed
+ * @cookie: The cookie representing the cache object
+ *
+ * Returns:
+ * * 0		- Success
+ * * -ENOBUFS	- No caching available
+ * * Other error code from the cache, such as -ENOMEM.
+ */
+static inline
+int fscache_begin_wait_operation(struct netfs_cache_resources *cres,
+				 struct fscache_cookie *cookie,
+				 enum fscache_want_state want_state)
+{
+	if (fscache_cookie_enabled(cookie))
+		return __fscache_begin_wait_operation(cres, cookie, want_state);
+	return -ENOBUFS;
+}
+
 /**
  * fscache_write - Start a write to the cache.
  * @cres: The cache resources to use
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

