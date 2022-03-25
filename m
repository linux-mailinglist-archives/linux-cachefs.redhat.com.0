Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B74E7317
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 13:23:09 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294--PKSTc_-OfaDovTos6MfGQ-1; Fri, 25 Mar 2022 08:23:05 -0400
X-MC-Unique: -PKSTc_-OfaDovTos6MfGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D76D818A6584;
	Fri, 25 Mar 2022 12:23:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8151543202C;
	Fri, 25 Mar 2022 12:23:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9149194036D;
	Fri, 25 Mar 2022 12:22:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71E011940361 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 12:22:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1FB772166B1F; Fri, 25 Mar 2022 12:22:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B12C2166B1E
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:22:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19A611066572
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:22:57 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-MYfTVhS0OXaTy9ACPvZ0pQ-1; Fri, 25 Mar 2022 08:22:52 -0400
X-MC-Unique: MYfTVhS0OXaTy9ACPvZ0pQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V89Vk7G_1648210965
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V89Vk7G_1648210965) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 20:22:46 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 25 Mar 2022 20:22:15 +0800
Message-Id: <20220325122223.102958-15-jefflexu@linux.alibaba.com>
In-Reply-To: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH v6 14/22] erofs: add
 erofs_fscache_read_folios() helper
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
Cc: gregkh@linuxfoundation.org, fannaihao@baidu.com, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add erofs_fscache_read_folios() helper reading from fscache. It supports
on-demand read semantics. That is, it will make the backend prepare for
the data when cache miss. Once data ready, it will reinitiate a read
from the cache.

This helper can then be used to implement .readpage()/.readahead() of
on-demand read semantics.

Besides also add erofs_fscache_read_folio() wrapper helper.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 30383d9adb62..6a55f7b5f883 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -7,6 +7,45 @@
 
 static struct fscache_volume *volume;
 
+/*
+ * erofs_fscache_read_folios - Read data from fscache.
+ *
+ * Fill the read data into page cache described by @start/len, which shall be
+ * both aligned with PAGE_SIZE. @pstart describes the corresponding physical
+ * start address in the cache file.
+ */
+static int erofs_fscache_read_folios(struct fscache_cookie *cookie,
+				     struct address_space *mapping,
+				     loff_t start, size_t len,
+				     loff_t pstart)
+{
+	struct netfs_cache_resources cres;
+	struct iov_iter iter;
+	int ret;
+
+	memset(&cres, 0, sizeof(cres));
+
+	ret = fscache_begin_read_operation(&cres, cookie);
+	if (ret)
+		return ret;
+
+	iov_iter_xarray(&iter, READ, &mapping->i_pages, start, len);
+
+	ret = fscache_read(&cres, pstart, &iter,
+			   NETFS_READ_HOLE_ONDEMAND, NULL, NULL);
+
+	fscache_end_operation(&cres);
+	return ret;
+}
+
+static inline int erofs_fscache_read_folio(struct fscache_cookie *cookie,
+					   struct folio *folio, loff_t pstart)
+{
+	return erofs_fscache_read_folios(cookie, folio_file_mapping(folio),
+					 folio_pos(folio), folio_size(folio),
+					 pstart);
+}
+
 static const struct address_space_operations erofs_fscache_blob_aops = {
 };
 
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

