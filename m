Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD3F4AE9AE
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Feb 2022 07:01:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-dHPiLjF-MF6DuMejcG8pdw-1; Wed, 09 Feb 2022 01:01:32 -0500
X-MC-Unique: dHPiLjF-MF6DuMejcG8pdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3E118C89DA;
	Wed,  9 Feb 2022 06:01:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08ED355F6F;
	Wed,  9 Feb 2022 06:01:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76A484CA93;
	Wed,  9 Feb 2022 06:01:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21961KYd002644 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 01:01:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D4425141DECD; Wed,  9 Feb 2022 06:01:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDDD1141DEC4
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5EDB833963
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:20 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-45-VsHyHVtyNzuq0vmcfc31bw-1; Wed, 09 Feb 2022 01:01:16 -0500
X-MC-Unique: VsHyHVtyNzuq0vmcfc31bw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V3zaQQi_1644386471
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V3zaQQi_1644386471) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 09 Feb 2022 14:01:11 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed,  9 Feb 2022 14:00:48 +0800
Message-Id: <20220209060108.43051-3-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org
Subject: [Linux-cachefs] [PATCH v3 02/22] fscache: add a method to support
	on-demand read semantics
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

Add .ondemand_read() callback to netfs_cache_ops to implement on-demand
read.

The precondition for implementing on-demand read semantics is that,
all blob files have been placed under corresponding directory with
correct file size (sparse files) on the first beginning. When upper fs
starts to access the blob file, it will "cache miss" (hit the hole).
Then .ondemand_read() callback can be called to notify backend to
prepare the data.

The implementation of .ondemand_read() callback can be backend specific.
The following patch will introduce the implementation for cachefiles,
which will notify user daemon the requested file range to read. The
.ondemand_read() callback will get blocked until the user daemon has
prepared the corresponding data.

Then once .ondemand_read() callback returns with 0, it is guaranteed
that the requested data has been ready. In this case, users can retry to
read from the backing file.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 Documentation/filesystems/netfs_library.rst | 18 +++++++++++++++
 include/linux/fscache.h                     | 25 +++++++++++++++++++++
 include/linux/netfs.h                       |  4 ++++
 3 files changed, 47 insertions(+)

diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 4f373a8ec47b..e544d6688100 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -466,6 +466,8 @@ operation table looks like the following::
 		int (*query_occupancy)(struct netfs_cache_resources *cres,
 				       loff_t start, size_t len, size_t granularity,
 				       loff_t *_data_start, size_t *_data_len);
+		int (*ondemand_read)(struct netfs_cache_resources *cres,
+				     loff_t start_pos, size_t len);
 	};
 
 With a termination handler function pointer::
@@ -552,6 +554,22 @@ The methods defined in the table are:
    It returns 0 if some data was found, -ENODATA if there was no usable data
    within the region or -ENOBUFS if there is no caching on this file.
 
+ * ``ondemand_read()``
+
+   [Optional] Called to make cache prepare for the data. It shall be called only
+   when on-demand read semantics is required. It will be called when a cache
+   miss is encountered. The function will make the backend somehow prepare for
+   the data in the region specified by @start_pos/@len of the cache file. It may
+   get blocked until the backend has prepared the data in the cache file
+   successfully, or error encountered.
+
+   Once it returns with 0, it is guaranteed that the requested data has been
+   ready in the cache file. In this case, users can retry to read from the cache
+   file.
+
+   It returns 0 if data has been ready in the cache file, or other error code
+   from the cache, such as -ENOMEM.
+
 Note that these methods are passed a pointer to the cache resource structure,
 not the read request structure as they could be used in other situations where
 there isn't a read request structure as well, such as writing dirty data to the
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index d2430da8aa67..efcd5d5c6726 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -514,6 +514,31 @@ int fscache_read(struct netfs_cache_resources *cres,
 			 term_func, term_func_priv);
 }
 
+/**
+ * fscache_ondemand_read - Make cache prepare for the data.
+ * @cres: The cache resources to use
+ * @start_pos: The beginning file offset in the cache file
+ * @len: The length of the file offset range in the cache file
+ *
+ * This shall only be called when a cache miss is encountered. It will make
+ * the backend somehow prepare for the data in the file offset range specified
+ * by @start_pos/@len of the cache file. It may get blocked until the backend
+ * has prepared the data in the cache file successfully, or error encountered.
+ *
+ * Returns:
+ * * 0		- Success (Data is ready in the cache file)
+ * * Other error code from the cache, such as -ENOMEM.
+ */
+static inline
+int fscache_ondemand_read(struct netfs_cache_resources *cres,
+			  loff_t start_pos, size_t len)
+{
+	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
+	if (ops->ondemand_read)
+		return ops->ondemand_read(cres, start_pos, len);
+	return -EOPNOTSUPP;
+}
+
 /**
  * fscache_begin_write_operation - Begin a write operation for the netfs lib
  * @cres: The cache resources for the write being performed
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 614f22213e21..81fe707ad38d 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -251,6 +251,10 @@ struct netfs_cache_ops {
 	int (*query_occupancy)(struct netfs_cache_resources *cres,
 			       loff_t start, size_t len, size_t granularity,
 			       loff_t *_data_start, size_t *_data_len);
+
+	/* Make cache prepare for the data */
+	int (*ondemand_read)(struct netfs_cache_resources *cres,
+			     loff_t start_pos, size_t len);
 };
 
 struct readahead_control;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

