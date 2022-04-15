Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7287502A14
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Apr 2022 14:36:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-PEdv9RJoNMWxd7WJP6XT2g-1; Fri, 15 Apr 2022 08:36:47 -0400
X-MC-Unique: PEdv9RJoNMWxd7WJP6XT2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56575811E83;
	Fri, 15 Apr 2022 12:36:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BB594087D99;
	Fri, 15 Apr 2022 12:36:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E8D9E1940352;
	Fri, 15 Apr 2022 12:36:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C678419451EF for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 12:36:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6BAB40E8118; Fri, 15 Apr 2022 12:36:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2DBC40E8100
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AF741C0691B
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:45 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-szNmMueYPOagejIA7Igfbg-1; Fri, 15 Apr 2022 08:36:42 -0400
X-MC-Unique: szNmMueYPOagejIA7Igfbg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R611e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VA7Ug1q_1650026197
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VA7Ug1q_1650026197) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Apr 2022 20:36:38 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 15 Apr 2022 20:36:07 +0800
Message-Id: <20220415123614.54024-15-jefflexu@linux.alibaba.com>
In-Reply-To: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
References: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v9 14/21] erofs: add
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
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add erofs_fscache_read_folios() helper reading from fscache. It supports
on-demand read semantics. That is, it will make the backend prepare for
the data when cache miss. Once data ready, it will read from the cache.

This helper can then be used to implement .readpage()/.readahead() of
on-demand read semantics.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/fscache.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 1c88614203d2..066f68c062e2 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -5,6 +5,59 @@
 #include <linux/fscache.h>
 #include "internal.h"
 
+/*
+ * Read data from fscache and fill the read data into page cache described by
+ * @start/len, which shall be both aligned with PAGE_SIZE. @pstart describes
+ * the start physical address in the cache file.
+ */
+static int erofs_fscache_read_folios(struct fscache_cookie *cookie,
+				     struct address_space *mapping,
+				     loff_t start, size_t len,
+				     loff_t pstart)
+{
+	enum netfs_io_source source;
+	struct netfs_io_subrequest subreq;
+	struct netfs_io_request rreq;
+	struct netfs_cache_resources *cres = &rreq.cache_resources;
+	struct iov_iter iter;
+	size_t done = 0;
+	int ret;
+
+	memset(&rreq, 0, sizeof(rreq));
+	memset(&subreq, 0, sizeof(subreq));
+	subreq.rreq = &rreq;
+
+	ret = fscache_begin_read_operation(cres, cookie);
+	if (ret)
+		return ret;
+
+	while (done < len) {
+		subreq.start = pstart + done;
+		subreq.len = len - done;
+		subreq.flags = 1 << NETFS_SREQ_ONDEMAND;
+
+		source = cres->ops->prepare_read(&subreq, LLONG_MAX);
+		if (WARN_ON(subreq.len == 0))
+			source = NETFS_INVALID_READ;
+		if (source != NETFS_READ_FROM_CACHE) {
+			ret = -EIO;
+			goto out;
+		}
+
+		iov_iter_xarray(&iter, READ, &mapping->i_pages,
+				start + done, subreq.len);
+		ret = fscache_read(cres, subreq.start, &iter,
+				   NETFS_READ_HOLE_FAIL, NULL, NULL);
+		if (ret)
+			goto out;
+
+		done += subreq.len;
+	}
+out:
+	fscache_end_operation(cres);
+	return ret;
+}
+
 static const struct address_space_operations erofs_fscache_meta_aops = {
 };
 
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

