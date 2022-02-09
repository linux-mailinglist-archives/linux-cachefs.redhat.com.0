Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD7C4AE9B8
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Feb 2022 07:01:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-JKUKVQ4TNPKgKd8_8oMVpg-1; Wed, 09 Feb 2022 01:01:36 -0500
X-MC-Unique: JKUKVQ4TNPKgKd8_8oMVpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E6DF10199A0;
	Wed,  9 Feb 2022 06:01:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7B555F70;
	Wed,  9 Feb 2022 06:01:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0F374A7C8;
	Wed,  9 Feb 2022 06:01:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21961WRW002732 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 01:01:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C01E492D1B; Wed,  9 Feb 2022 06:01:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 281E3492D18
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FDDC802A97
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:32 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-227-eYN7uYsbOp--jwOR-h7maw-1; Wed, 09 Feb 2022 01:01:29 -0500
X-MC-Unique: eYN7uYsbOp--jwOR-h7maw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R701e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V3zaQT8_1644386484
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V3zaQT8_1644386484) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 09 Feb 2022 14:01:25 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed,  9 Feb 2022 14:00:58 +0800
Message-Id: <20220209060108.43051-13-jefflexu@linux.alibaba.com>
In-Reply-To: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
References: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org
Subject: [Linux-cachefs] [PATCH v3 12/22] erofs: add
	erofs_fscache_read_page() helper
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add erofs_fscache_read_page() helper reading from fscache. It supports
on-demand read semantics. That is, it will make the backend prepare for
the data when cache miss. Once data ready, it will reinitiate a read
from the cache.

This helper can then be used to implement .readpage() of on-demand
reading semantics.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 3addd9aa549c..f4aade711664 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -6,6 +6,42 @@
 
 static struct fscache_volume *volume;
 
+static int erofs_fscache_read_page(struct fscache_cookie *cookie,
+				   struct page *page, loff_t start_pos)
+{
+	struct netfs_cache_resources cres;
+	struct bio_vec bvec[1];
+	struct iov_iter iter;
+	int ret;
+
+	memset(&cres, 0, sizeof(cres));
+
+	ret = fscache_begin_read_operation(&cres, cookie);
+	if (ret)
+		return ret;
+
+	bvec[0].bv_page         = page;
+	bvec[0].bv_offset       = 0;
+	bvec[0].bv_len          = PAGE_SIZE;
+	iov_iter_bvec(&iter, READ, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
+
+	ret = fscache_read(&cres, start_pos, &iter,
+			   NETFS_READ_HOLE_FAIL, NULL, NULL);
+	/*
+	 * -ENODATA will be returned when cache miss. In this case, make the
+	 * backend prepare for the data and then reinitiate a read from cache.
+	 */
+	if (ret == -ENODATA) {
+		ret = fscache_ondemand_read(&cres, start_pos, PAGE_SIZE);
+		if (ret == 0)
+			ret = fscache_read(&cres, start_pos, &iter,
+					   NETFS_READ_HOLE_FAIL, NULL, NULL);
+	}
+
+	fscache_end_operation(&cres);
+	return ret;
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

