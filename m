Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93902712840
	for <lists+linux-cachefs@lfdr.de>; Fri, 26 May 2023 16:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685111482;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+I1OF7dVEXJh3J+q+Px6NwbkBbG3KkLU7pReKLwNyQQ=;
	b=aDDbwMOJ8tBgiZM+Z2VszPZUspSkz+vNYo1kySDF/n6hu7tDKXxoVe4i89Cr76B0DPmpbz
	/UOlUjKon1fcgF8hyMLXHQ0LtZ5D00+Fg+m/eEHn+uSv6ejnCxOlZoNMTBXYNE2nMVqXfI
	PL3l174I0PgTVoi/sYenlyPp+m0li5s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-npWtlL6jNFWgWGLTkhErrg-1; Fri, 26 May 2023 10:31:19 -0400
X-MC-Unique: npWtlL6jNFWgWGLTkhErrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0FD68039A9;
	Fri, 26 May 2023 14:31:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5F212166B2B;
	Fri, 26 May 2023 14:31:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 99F1519465B2;
	Fri, 26 May 2023 14:31:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 09E1B19465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 26 May 2023 14:31:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F19862166B2F; Fri, 26 May 2023 14:31:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39ACC2166B2B;
 Fri, 26 May 2023 14:31:14 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 26 May 2023 15:30:58 +0100
Message-Id: <20230526143104.882842-3-dhowells@redhat.com>
In-Reply-To: <20230526143104.882842-1-dhowells@redhat.com>
References: <20230526143104.882842-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH net-next 2/8] Drop the netfs_ prefix from
 netfs_extract_iter_to_sg()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename netfs_extract_iter_to_sg() and its auxiliary functions to drop the
netfs_ prefix.

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
 fs/cifs/smb2ops.c   |  4 +--
 fs/cifs/smbdirect.c |  2 +-
 include/linux/uio.h |  6 ++---
 lib/scatterlist.c   | 66 ++++++++++++++++++++++-----------------------
 4 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index a295e4c2d54e..196bc49e73b8 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -4335,8 +4335,8 @@ static void *smb2_get_aead_req(struct crypto_aead *tfm, struct smb_rqst *rqst,
 		}
 		sgtable.orig_nents = sgtable.nents;
 
-		rc = netfs_extract_iter_to_sg(iter, count, &sgtable,
-					      num_sgs - sgtable.nents, 0);
+		rc = extract_iter_to_sg(iter, count, &sgtable,
+					num_sgs - sgtable.nents, 0);
 		iov_iter_revert(iter, rc);
 		sgtable.orig_nents = sgtable.nents;
 	}
diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 0362ebd4fa0f..223e17c16b60 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -2227,7 +2227,7 @@ static int smbd_iter_to_mr(struct smbd_connection *info,
 
 	memset(sgt->sgl, 0, max_sg * sizeof(struct scatterlist));
 
-	ret = netfs_extract_iter_to_sg(iter, iov_iter_count(iter), sgt, max_sg, 0);
+	ret = extract_iter_to_sg(iter, iov_iter_count(iter), sgt, max_sg, 0);
 	WARN_ON(ret < 0);
 	if (sgt->nents > 0)
 		sg_mark_end(&sgt->sgl[sgt->nents - 1]);
diff --git a/include/linux/uio.h b/include/linux/uio.h
index 09b8b107956e..0ccb983cf645 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -434,8 +434,8 @@ static inline bool iov_iter_extract_will_pin(const struct iov_iter *iter)
 }
 
 struct sg_table;
-ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t len,
-				 struct sg_table *sgtable, unsigned int sg_max,
-				 iov_iter_extraction_t extraction_flags);
+ssize_t extract_iter_to_sg(struct iov_iter *iter, size_t len,
+			   struct sg_table *sgtable, unsigned int sg_max,
+			   iov_iter_extraction_t extraction_flags);
 
 #endif
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 31ef86e6a33a..8612b9deaa7e 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -1101,11 +1101,11 @@ EXPORT_SYMBOL(sg_zero_buffer);
  * Extract and pin a list of up to sg_max pages from UBUF- or IOVEC-class
  * iterators, and add them to the scatterlist.
  */
-static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
-					ssize_t maxsize,
-					struct sg_table *sgtable,
-					unsigned int sg_max,
-					iov_iter_extraction_t extraction_flags)
+static ssize_t extract_user_to_sg(struct iov_iter *iter,
+				  ssize_t maxsize,
+				  struct sg_table *sgtable,
+				  unsigned int sg_max,
+				  iov_iter_extraction_t extraction_flags)
 {
 	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
 	struct page **pages;
@@ -1154,11 +1154,11 @@ static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
  * Extract up to sg_max pages from a BVEC-type iterator and add them to the
  * scatterlist.  The pages are not pinned.
  */
-static ssize_t netfs_extract_bvec_to_sg(struct iov_iter *iter,
-					ssize_t maxsize,
-					struct sg_table *sgtable,
-					unsigned int sg_max,
-					iov_iter_extraction_t extraction_flags)
+static ssize_t extract_bvec_to_sg(struct iov_iter *iter,
+				  ssize_t maxsize,
+				  struct sg_table *sgtable,
+				  unsigned int sg_max,
+				  iov_iter_extraction_t extraction_flags)
 {
 	const struct bio_vec *bv = iter->bvec;
 	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
@@ -1200,11 +1200,11 @@ static ssize_t netfs_extract_bvec_to_sg(struct iov_iter *iter,
  * scatterlist.  This can deal with vmalloc'd buffers as well as kmalloc'd or
  * static buffers.  The pages are not pinned.
  */
-static ssize_t netfs_extract_kvec_to_sg(struct iov_iter *iter,
-					ssize_t maxsize,
-					struct sg_table *sgtable,
-					unsigned int sg_max,
-					iov_iter_extraction_t extraction_flags)
+static ssize_t extract_kvec_to_sg(struct iov_iter *iter,
+				  ssize_t maxsize,
+				  struct sg_table *sgtable,
+				  unsigned int sg_max,
+				  iov_iter_extraction_t extraction_flags)
 {
 	const struct kvec *kv = iter->kvec;
 	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
@@ -1261,11 +1261,11 @@ static ssize_t netfs_extract_kvec_to_sg(struct iov_iter *iter,
  * Extract up to sg_max folios from an XARRAY-type iterator and add them to
  * the scatterlist.  The pages are not pinned.
  */
-static ssize_t netfs_extract_xarray_to_sg(struct iov_iter *iter,
-					  ssize_t maxsize,
-					  struct sg_table *sgtable,
-					  unsigned int sg_max,
-					  iov_iter_extraction_t extraction_flags)
+static ssize_t extract_xarray_to_sg(struct iov_iter *iter,
+				    ssize_t maxsize,
+				    struct sg_table *sgtable,
+				    unsigned int sg_max,
+				    iov_iter_extraction_t extraction_flags)
 {
 	struct scatterlist *sg = sgtable->sgl + sgtable->nents;
 	struct xarray *xa = iter->xarray;
@@ -1307,7 +1307,7 @@ static ssize_t netfs_extract_xarray_to_sg(struct iov_iter *iter,
 }
 
 /**
- * netfs_extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
+ * extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
  * @iter: The iterator to extract from
  * @maxsize: The amount of iterator to copy
  * @sgtable: The scatterlist table to fill in
@@ -1334,9 +1334,9 @@ static ssize_t netfs_extract_xarray_to_sg(struct iov_iter *iter,
  * The iov_iter_extract_mode() function should be used to query how cleanup
  * should be performed.
  */
-ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t maxsize,
-				 struct sg_table *sgtable, unsigned int sg_max,
-				 iov_iter_extraction_t extraction_flags)
+ssize_t extract_iter_to_sg(struct iov_iter *iter, size_t maxsize,
+			   struct sg_table *sgtable, unsigned int sg_max,
+			   iov_iter_extraction_t extraction_flags)
 {
 	if (maxsize == 0)
 		return 0;
@@ -1344,21 +1344,21 @@ ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t maxsize,
 	switch (iov_iter_type(iter)) {
 	case ITER_UBUF:
 	case ITER_IOVEC:
-		return netfs_extract_user_to_sg(iter, maxsize, sgtable, sg_max,
-						extraction_flags);
+		return extract_user_to_sg(iter, maxsize, sgtable, sg_max,
+					  extraction_flags);
 	case ITER_BVEC:
-		return netfs_extract_bvec_to_sg(iter, maxsize, sgtable, sg_max,
-						extraction_flags);
+		return extract_bvec_to_sg(iter, maxsize, sgtable, sg_max,
+					  extraction_flags);
 	case ITER_KVEC:
-		return netfs_extract_kvec_to_sg(iter, maxsize, sgtable, sg_max,
-						extraction_flags);
+		return extract_kvec_to_sg(iter, maxsize, sgtable, sg_max,
+					  extraction_flags);
 	case ITER_XARRAY:
-		return netfs_extract_xarray_to_sg(iter, maxsize, sgtable, sg_max,
-						  extraction_flags);
+		return extract_xarray_to_sg(iter, maxsize, sgtable, sg_max,
+					    extraction_flags);
 	default:
 		pr_err("%s(%u) unsupported\n", __func__, iov_iter_type(iter));
 		WARN_ON_ONCE(1);
 		return -EIO;
 	}
 }
-EXPORT_SYMBOL_GPL(netfs_extract_iter_to_sg);
+EXPORT_SYMBOL_GPL(extract_iter_to_sg);
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

