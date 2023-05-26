Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 218FE71283E
	for <lists+linux-cachefs@lfdr.de>; Fri, 26 May 2023 16:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685111480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oDHdYxg4/qVmPoycMkkudO5blMlmBiC6zLfnd3FOEns=;
	b=JoHhxr2TJs5RKeTFWYYux+HM4kgpekhBpC+zEXN87bEscmqQ3870UwVh/zpqcy/Fa9dQNC
	qXUiphJofuRk0lOkfLkJ4JLhYezkitT30w8lzKRppsJq5FaJWl8ANXxjYsohHgatmggKk9
	D7pZ2KIb6iqYBj4ykYF5npEJhmXc1PM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-dgatd9r2M0Of3AhR5AvjDQ-1; Fri, 26 May 2023 10:31:16 -0400
X-MC-Unique: dgatd9r2M0Of3AhR5AvjDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8AF6185A797;
	Fri, 26 May 2023 14:31:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A34C5400E13A;
	Fri, 26 May 2023 14:31:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3592F19465B2;
	Fri, 26 May 2023 14:31:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9515619465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 26 May 2023 14:31:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69915140E963; Fri, 26 May 2023 14:31:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BED1140E95D;
 Fri, 26 May 2023 14:31:10 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 26 May 2023 15:30:57 +0100
Message-Id: <20230526143104.882842-2-dhowells@redhat.com>
In-Reply-To: <20230526143104.882842-1-dhowells@redhat.com>
References: <20230526143104.882842-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH net-next 1/8] Move
 netfs_extract_iter_to_sg() to lib/scatterlist.c
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
Cc: Jens Axboe <axboe@kernel.dk>, Steve French <sfrench@samba.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, David Ahern <dsahern@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-cachefs@redhat.com,
 linux-crypto@vger.kernel.org, Shyam Prasad N <nspmangalore@gmail.com>,
 linux-fsdevel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move netfs_extract_iter_to_sg() to lib/scatterlist.c as it's going to be
used by more than just network filesystems (AF_ALG, for example).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jens Axboe <axboe@kernel.dk>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: "David S. Miller" <davem@davemloft.net>
cc: linux-crypto@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
cc: netdev@vger.kernel.org
---
 fs/netfs/iterator.c         | 266 -----------------------------------
 include/linux/netfs.h       |   4 -
 include/linux/scatterlist.h |   1 +
 include/linux/uio.h         |   5 +
 lib/scatterlist.c           | 267 ++++++++++++++++++++++++++++++++++++
 5 files changed, 273 insertions(+), 270 deletions(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index 8a4c86687429..2ff07ba655a0 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -101,269 +101,3 @@ ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 	return npages;
 }
 EXPORT_SYMBOL_GPL(netfs_extract_user_iter);
-
-/*
- * Extract and pin a list of up to sg_max pages from UBUF- or IOVEC-class
- * iterators, and add them to the scatterlist.
- */
-static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
-					ssize_t maxsize,
-					struct sg_table *sgtable,
-					unsigned int sg_max,
-					iov_iter_extraction_t extraction_flags)
-{
-	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
-	struct page **pages;
-	unsigned int npages;
-	ssize_t ret = 0, res;
-	size_t len, off;
-
-	/* We decant the page list into the tail of the scatterlist */
-	pages = (void *)sgtable->sgl + array_size(sg_max, sizeof(struct scatterlist));
-	pages -= sg_max;
-
-	do {
-		res = iov_iter_extract_pages(iter, &pages, maxsize, sg_max,
-					     extraction_flags, &off);
-		if (res < 0)
-			goto failed;
-
-		len = res;
-		maxsize -= len;
-		ret += len;
-		npages = DIV_ROUND_UP(off + len, PAGE_SIZE);
-		sg_max -= npages;
-
-		for (; npages > 0; npages--) {
-			struct page *page = *pages;
-			size_t seg = min_t(size_t, PAGE_SIZE - off, len);
-
-			*pages++ = NULL;
-			sg_set_page(sg, page, seg, off);
-			sgtable->nents++;
-			sg++;
-			len -= seg;
-			off = 0;
-		}
-	} while (maxsize > 0 && sg_max > 0);
-
-	return ret;
-
-failed:
-	while (sgtable->nents > sgtable->orig_nents)
-		put_page(sg_page(&sgtable->sgl[--sgtable->nents]));
-	return res;
-}
-
-/*
- * Extract up to sg_max pages from a BVEC-type iterator and add them to the
- * scatterlist.  The pages are not pinned.
- */
-static ssize_t netfs_extract_bvec_to_sg(struct iov_iter *iter,
-					ssize_t maxsize,
-					struct sg_table *sgtable,
-					unsigned int sg_max,
-					iov_iter_extraction_t extraction_flags)
-{
-	const struct bio_vec *bv = iter->bvec;
-	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
-	unsigned long start = iter->iov_offset;
-	unsigned int i;
-	ssize_t ret = 0;
-
-	for (i = 0; i < iter->nr_segs; i++) {
-		size_t off, len;
-
-		len = bv[i].bv_len;
-		if (start >= len) {
-			start -= len;
-			continue;
-		}
-
-		len = min_t(size_t, maxsize, len - start);
-		off = bv[i].bv_offset + start;
-
-		sg_set_page(sg, bv[i].bv_page, len, off);
-		sgtable->nents++;
-		sg++;
-		sg_max--;
-
-		ret += len;
-		maxsize -= len;
-		if (maxsize <= 0 || sg_max == 0)
-			break;
-		start = 0;
-	}
-
-	if (ret > 0)
-		iov_iter_advance(iter, ret);
-	return ret;
-}
-
-/*
- * Extract up to sg_max pages from a KVEC-type iterator and add them to the
- * scatterlist.  This can deal with vmalloc'd buffers as well as kmalloc'd or
- * static buffers.  The pages are not pinned.
- */
-static ssize_t netfs_extract_kvec_to_sg(struct iov_iter *iter,
-					ssize_t maxsize,
-					struct sg_table *sgtable,
-					unsigned int sg_max,
-					iov_iter_extraction_t extraction_flags)
-{
-	const struct kvec *kv = iter->kvec;
-	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
-	unsigned long start = iter->iov_offset;
-	unsigned int i;
-	ssize_t ret = 0;
-
-	for (i = 0; i < iter->nr_segs; i++) {
-		struct page *page;
-		unsigned long kaddr;
-		size_t off, len, seg;
-
-		len = kv[i].iov_len;
-		if (start >= len) {
-			start -= len;
-			continue;
-		}
-
-		kaddr = (unsigned long)kv[i].iov_base + start;
-		off = kaddr & ~PAGE_MASK;
-		len = min_t(size_t, maxsize, len - start);
-		kaddr &= PAGE_MASK;
-
-		maxsize -= len;
-		ret += len;
-		do {
-			seg = min_t(size_t, len, PAGE_SIZE - off);
-			if (is_vmalloc_or_module_addr((void *)kaddr))
-				page = vmalloc_to_page((void *)kaddr);
-			else
-				page = virt_to_page(kaddr);
-
-			sg_set_page(sg, page, len, off);
-			sgtable->nents++;
-			sg++;
-			sg_max--;
-
-			len -= seg;
-			kaddr += PAGE_SIZE;
-			off = 0;
-		} while (len > 0 && sg_max > 0);
-
-		if (maxsize <= 0 || sg_max == 0)
-			break;
-		start = 0;
-	}
-
-	if (ret > 0)
-		iov_iter_advance(iter, ret);
-	return ret;
-}
-
-/*
- * Extract up to sg_max folios from an XARRAY-type iterator and add them to
- * the scatterlist.  The pages are not pinned.
- */
-static ssize_t netfs_extract_xarray_to_sg(struct iov_iter *iter,
-					  ssize_t maxsize,
-					  struct sg_table *sgtable,
-					  unsigned int sg_max,
-					  iov_iter_extraction_t extraction_flags)
-{
-	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
-	struct xarray *xa = iter->xarray;
-	struct folio *folio;
-	loff_t start = iter->xarray_start + iter->iov_offset;
-	pgoff_t index = start / PAGE_SIZE;
-	ssize_t ret = 0;
-	size_t offset, len;
-	XA_STATE(xas, xa, index);
-
-	rcu_read_lock();
-
-	xas_for_each(&xas, folio, ULONG_MAX) {
-		if (xas_retry(&xas, folio))
-			continue;
-		if (WARN_ON(xa_is_value(folio)))
-			break;
-		if (WARN_ON(folio_test_hugetlb(folio)))
-			break;
-
-		offset = offset_in_folio(folio, start);
-		len = min_t(size_t, maxsize, folio_size(folio) - offset);
-
-		sg_set_page(sg, folio_page(folio, 0), len, offset);
-		sgtable->nents++;
-		sg++;
-		sg_max--;
-
-		maxsize -= len;
-		ret += len;
-		if (maxsize <= 0 || sg_max == 0)
-			break;
-	}
-
-	rcu_read_unlock();
-	if (ret > 0)
-		iov_iter_advance(iter, ret);
-	return ret;
-}
-
-/**
- * netfs_extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
- * @iter: The iterator to extract from
- * @maxsize: The amount of iterator to copy
- * @sgtable: The scatterlist table to fill in
- * @sg_max: Maximum number of elements in @sgtable that may be filled
- * @extraction_flags: Flags to qualify the request
- *
- * Extract the page fragments from the given amount of the source iterator and
- * add them to a scatterlist that refers to all of those bits, to a maximum
- * addition of @sg_max elements.
- *
- * The pages referred to by UBUF- and IOVEC-type iterators are extracted and
- * pinned; BVEC-, KVEC- and XARRAY-type are extracted but aren't pinned; PIPE-
- * and DISCARD-type are not supported.
- *
- * No end mark is placed on the scatterlist; that's left to the caller.
- *
- * @extraction_flags can have ITER_ALLOW_P2PDMA set to request peer-to-peer DMA
- * be allowed on the pages extracted.
- *
- * If successul, @sgtable->nents is updated to include the number of elements
- * added and the number of bytes added is returned.  @sgtable->orig_nents is
- * left unaltered.
- *
- * The iov_iter_extract_mode() function should be used to query how cleanup
- * should be performed.
- */
-ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t maxsize,
-				 struct sg_table *sgtable, unsigned int sg_max,
-				 iov_iter_extraction_t extraction_flags)
-{
-	if (maxsize == 0)
-		return 0;
-
-	switch (iov_iter_type(iter)) {
-	case ITER_UBUF:
-	case ITER_IOVEC:
-		return netfs_extract_user_to_sg(iter, maxsize, sgtable, sg_max,
-						extraction_flags);
-	case ITER_BVEC:
-		return netfs_extract_bvec_to_sg(iter, maxsize, sgtable, sg_max,
-						extraction_flags);
-	case ITER_KVEC:
-		return netfs_extract_kvec_to_sg(iter, maxsize, sgtable, sg_max,
-						extraction_flags);
-	case ITER_XARRAY:
-		return netfs_extract_xarray_to_sg(iter, maxsize, sgtable, sg_max,
-						  extraction_flags);
-	default:
-		pr_err("%s(%u) unsupported\n", __func__, iov_iter_type(iter));
-		WARN_ON_ONCE(1);
-		return -EIO;
-	}
-}
-EXPORT_SYMBOL_GPL(netfs_extract_iter_to_sg);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index a1f3522daa69..b11a84f6c32b 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -300,10 +300,6 @@ void netfs_stats_show(struct seq_file *);
 ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 				struct iov_iter *new,
 				iov_iter_extraction_t extraction_flags);
-struct sg_table;
-ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t len,
-				 struct sg_table *sgtable, unsigned int sg_max,
-				 iov_iter_extraction_t extraction_flags);
 
 /**
  * netfs_inode - Get the netfs inode context from the inode
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 375a5e90d86a..9e6a4457f4fc 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/bug.h>
 #include <linux/mm.h>
+#include <linux/bvec.h>
 #include <asm/io.h>
 
 struct scatterlist {
diff --git a/include/linux/uio.h b/include/linux/uio.h
index 044c1d8c230c..09b8b107956e 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -433,4 +433,9 @@ static inline bool iov_iter_extract_will_pin(const struct iov_iter *iter)
 	return user_backed_iter(iter);
 }
 
+struct sg_table;
+ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t len,
+				 struct sg_table *sgtable, unsigned int sg_max,
+				 iov_iter_extraction_t extraction_flags);
+
 #endif
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 8d7519a8f308..31ef86e6a33a 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -9,6 +9,7 @@
 #include <linux/scatterlist.h>
 #include <linux/highmem.h>
 #include <linux/kmemleak.h>
+#include <linux/uio.h>
 
 /**
  * sg_next - return the next scatterlist entry in a list
@@ -1095,3 +1096,269 @@ size_t sg_zero_buffer(struct scatterlist *sgl, unsigned int nents,
 	return offset;
 }
 EXPORT_SYMBOL(sg_zero_buffer);
+
+/*
+ * Extract and pin a list of up to sg_max pages from UBUF- or IOVEC-class
+ * iterators, and add them to the scatterlist.
+ */
+static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
+					ssize_t maxsize,
+					struct sg_table *sgtable,
+					unsigned int sg_max,
+					iov_iter_extraction_t extraction_flags)
+{
+	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
+	struct page **pages;
+	unsigned int npages;
+	ssize_t ret = 0, res;
+	size_t len, off;
+
+	/* We decant the page list into the tail of the scatterlist */
+	pages = (void *)sgtable->sgl + array_size(sg_max, sizeof(struct scatterlist));
+	pages -= sg_max;
+
+	do {
+		res = iov_iter_extract_pages(iter, &pages, maxsize, sg_max,
+					     extraction_flags, &off);
+		if (res < 0)
+			goto failed;
+
+		len = res;
+		maxsize -= len;
+		ret += len;
+		npages = DIV_ROUND_UP(off + len, PAGE_SIZE);
+		sg_max -= npages;
+
+		for (; npages > 0; npages--) {
+			struct page *page = *pages;
+			size_t seg = min_t(size_t, PAGE_SIZE - off, len);
+
+			*pages++ = NULL;
+			sg_set_page(sg, page, seg, off);
+			sgtable->nents++;
+			sg++;
+			len -= seg;
+			off = 0;
+		}
+	} while (maxsize > 0 && sg_max > 0);
+
+	return ret;
+
+failed:
+	while (sgtable->nents > sgtable->orig_nents)
+		put_page(sg_page(&sgtable->sgl[--sgtable->nents]));
+	return res;
+}
+
+/*
+ * Extract up to sg_max pages from a BVEC-type iterator and add them to the
+ * scatterlist.  The pages are not pinned.
+ */
+static ssize_t netfs_extract_bvec_to_sg(struct iov_iter *iter,
+					ssize_t maxsize,
+					struct sg_table *sgtable,
+					unsigned int sg_max,
+					iov_iter_extraction_t extraction_flags)
+{
+	const struct bio_vec *bv = iter->bvec;
+	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
+	unsigned long start = iter->iov_offset;
+	unsigned int i;
+	ssize_t ret = 0;
+
+	for (i = 0; i < iter->nr_segs; i++) {
+		size_t off, len;
+
+		len = bv[i].bv_len;
+		if (start >= len) {
+			start -= len;
+			continue;
+		}
+
+		len = min_t(size_t, maxsize, len - start);
+		off = bv[i].bv_offset + start;
+
+		sg_set_page(sg, bv[i].bv_page, len, off);
+		sgtable->nents++;
+		sg++;
+		sg_max--;
+
+		ret += len;
+		maxsize -= len;
+		if (maxsize <= 0 || sg_max == 0)
+			break;
+		start = 0;
+	}
+
+	if (ret > 0)
+		iov_iter_advance(iter, ret);
+	return ret;
+}
+
+/*
+ * Extract up to sg_max pages from a KVEC-type iterator and add them to the
+ * scatterlist.  This can deal with vmalloc'd buffers as well as kmalloc'd or
+ * static buffers.  The pages are not pinned.
+ */
+static ssize_t netfs_extract_kvec_to_sg(struct iov_iter *iter,
+					ssize_t maxsize,
+					struct sg_table *sgtable,
+					unsigned int sg_max,
+					iov_iter_extraction_t extraction_flags)
+{
+	const struct kvec *kv = iter->kvec;
+	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
+	unsigned long start = iter->iov_offset;
+	unsigned int i;
+	ssize_t ret = 0;
+
+	for (i = 0; i < iter->nr_segs; i++) {
+		struct page *page;
+		unsigned long kaddr;
+		size_t off, len, seg;
+
+		len = kv[i].iov_len;
+		if (start >= len) {
+			start -= len;
+			continue;
+		}
+
+		kaddr = (unsigned long)kv[i].iov_base + start;
+		off = kaddr & ~PAGE_MASK;
+		len = min_t(size_t, maxsize, len - start);
+		kaddr &= PAGE_MASK;
+
+		maxsize -= len;
+		ret += len;
+		do {
+			seg = min_t(size_t, len, PAGE_SIZE - off);
+			if (is_vmalloc_or_module_addr((void *)kaddr))
+				page = vmalloc_to_page((void *)kaddr);
+			else
+				page = virt_to_page(kaddr);
+
+			sg_set_page(sg, page, len, off);
+			sgtable->nents++;
+			sg++;
+			sg_max--;
+
+			len -= seg;
+			kaddr += PAGE_SIZE;
+			off = 0;
+		} while (len > 0 && sg_max > 0);
+
+		if (maxsize <= 0 || sg_max == 0)
+			break;
+		start = 0;
+	}
+
+	if (ret > 0)
+		iov_iter_advance(iter, ret);
+	return ret;
+}
+
+/*
+ * Extract up to sg_max folios from an XARRAY-type iterator and add them to
+ * the scatterlist.  The pages are not pinned.
+ */
+static ssize_t netfs_extract_xarray_to_sg(struct iov_iter *iter,
+					  ssize_t maxsize,
+					  struct sg_table *sgtable,
+					  unsigned int sg_max,
+					  iov_iter_extraction_t extraction_flags)
+{
+	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
+	struct xarray *xa = iter->xarray;
+	struct folio *folio;
+	loff_t start = iter->xarray_start + iter->iov_offset;
+	pgoff_t index = start / PAGE_SIZE;
+	ssize_t ret = 0;
+	size_t offset, len;
+	XA_STATE(xas, xa, index);
+
+	rcu_read_lock();
+
+	xas_for_each(&xas, folio, ULONG_MAX) {
+		if (xas_retry(&xas, folio))
+			continue;
+		if (WARN_ON(xa_is_value(folio)))
+			break;
+		if (WARN_ON(folio_test_hugetlb(folio)))
+			break;
+
+		offset = offset_in_folio(folio, start);
+		len = min_t(size_t, maxsize, folio_size(folio) - offset);
+
+		sg_set_page(sg, folio_page(folio, 0), len, offset);
+		sgtable->nents++;
+		sg++;
+		sg_max--;
+
+		maxsize -= len;
+		ret += len;
+		if (maxsize <= 0 || sg_max == 0)
+			break;
+	}
+
+	rcu_read_unlock();
+	if (ret > 0)
+		iov_iter_advance(iter, ret);
+	return ret;
+}
+
+/**
+ * netfs_extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
+ * @iter: The iterator to extract from
+ * @maxsize: The amount of iterator to copy
+ * @sgtable: The scatterlist table to fill in
+ * @sg_max: Maximum number of elements in @sgtable that may be filled
+ * @extraction_flags: Flags to qualify the request
+ *
+ * Extract the page fragments from the given amount of the source iterator and
+ * add them to a scatterlist that refers to all of those bits, to a maximum
+ * addition of @sg_max elements.
+ *
+ * The pages referred to by UBUF- and IOVEC-type iterators are extracted and
+ * pinned; BVEC-, KVEC- and XARRAY-type are extracted but aren't pinned; PIPE-
+ * and DISCARD-type are not supported.
+ *
+ * No end mark is placed on the scatterlist; that's left to the caller.
+ *
+ * @extraction_flags can have ITER_ALLOW_P2PDMA set to request peer-to-peer DMA
+ * be allowed on the pages extracted.
+ *
+ * If successul, @sgtable->nents is updated to include the number of elements
+ * added and the number of bytes added is returned.  @sgtable->orig_nents is
+ * left unaltered.
+ *
+ * The iov_iter_extract_mode() function should be used to query how cleanup
+ * should be performed.
+ */
+ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t maxsize,
+				 struct sg_table *sgtable, unsigned int sg_max,
+				 iov_iter_extraction_t extraction_flags)
+{
+	if (maxsize == 0)
+		return 0;
+
+	switch (iov_iter_type(iter)) {
+	case ITER_UBUF:
+	case ITER_IOVEC:
+		return netfs_extract_user_to_sg(iter, maxsize, sgtable, sg_max,
+						extraction_flags);
+	case ITER_BVEC:
+		return netfs_extract_bvec_to_sg(iter, maxsize, sgtable, sg_max,
+						extraction_flags);
+	case ITER_KVEC:
+		return netfs_extract_kvec_to_sg(iter, maxsize, sgtable, sg_max,
+						extraction_flags);
+	case ITER_XARRAY:
+		return netfs_extract_xarray_to_sg(iter, maxsize, sgtable, sg_max,
+						  extraction_flags);
+	default:
+		pr_err("%s(%u) unsupported\n", __func__, iov_iter_type(iter));
+		WARN_ON_ONCE(1);
+		return -EIO;
+	}
+}
+EXPORT_SYMBOL_GPL(netfs_extract_iter_to_sg);
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

