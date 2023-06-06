Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C02B7243CA
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Jun 2023 15:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686056956;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FxchigUjxG33I+XRtTKoHHXMLsckqBn1tTS5JFMbIv4=;
	b=ZYMNUp2g3lyjl3vinQMQiyAYqN/bVfNj4v25seZ/xqE3iTXv+PVVOf/cMgU61Ori4XUlef
	wI33S9gxAxE9BMs+V5ye8iODxZ7kiQGZFoEzq5AsdgpMah35s0r/DwVBV0vnPWXI/X9M3G
	vrSSUDJT+9VRUrnmVs+CSMo83s1+UAc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-EkCdTMWfPoeRmfoohFnd0A-1; Tue, 06 Jun 2023 09:09:13 -0400
X-MC-Unique: EkCdTMWfPoeRmfoohFnd0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18C94801182;
	Tue,  6 Jun 2023 13:09:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D145D140E954;
	Tue,  6 Jun 2023 13:09:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 96CB119466DF;
	Tue,  6 Jun 2023 13:09:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8789C19465BA for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 13:09:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 62E2A4087C77; Tue,  6 Jun 2023 13:09:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0B514087C62;
 Tue,  6 Jun 2023 13:09:05 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue,  6 Jun 2023 14:08:47 +0100
Message-ID: <20230606130856.1970660-2-dhowells@redhat.com>
In-Reply-To: <20230606130856.1970660-1-dhowells@redhat.com>
References: <20230606130856.1970660-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH net-next v3 01/10] Drop the netfs_ prefix
 from netfs_extract_iter_to_sg()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
cc: "David S. Miller" <davem@davemloft.net>
cc: Eric Dumazet <edumazet@google.com>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: linux-crypto@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
cc: netdev@vger.kernel.org
---

Notes:
    ver #3)
     - Deal with fs/cifs/ moving.
     - Reimpose the ALG_MAX_PAGES limit in hash_sendmsg() for kernel iters.
    
    ver #2:
     - Put the "netfs_" prefix removal first to shorten lines and avoid
       checkpatch 80-char warnings.

 fs/netfs/iterator.c       | 66 +++++++++++++++++++--------------------
 fs/smb/client/smb2ops.c   |  4 +--
 fs/smb/client/smbdirect.c |  2 +-
 include/linux/netfs.h     |  6 ++--
 4 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index 8a4c86687429..f8eba3de1a97 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -106,11 +106,11 @@ EXPORT_SYMBOL_GPL(netfs_extract_user_iter);
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
@@ -159,11 +159,11 @@ static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
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
@@ -205,11 +205,11 @@ static ssize_t netfs_extract_bvec_to_sg(struct iov_iter *iter,
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
@@ -266,11 +266,11 @@ static ssize_t netfs_extract_kvec_to_sg(struct iov_iter *iter,
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
@@ -312,7 +312,7 @@ static ssize_t netfs_extract_xarray_to_sg(struct iov_iter *iter,
 }
 
 /**
- * netfs_extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
+ * extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
  * @iter: The iterator to extract from
  * @maxsize: The amount of iterator to copy
  * @sgtable: The scatterlist table to fill in
@@ -339,9 +339,9 @@ static ssize_t netfs_extract_xarray_to_sg(struct iov_iter *iter,
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
@@ -349,21 +349,21 @@ ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t maxsize,
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
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 6e3be58cfe49..38d2265c77fd 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -4333,8 +4333,8 @@ static void *smb2_get_aead_req(struct crypto_aead *tfm, struct smb_rqst *rqst,
 		}
 		sgtable.orig_nents = sgtable.nents;
 
-		rc = netfs_extract_iter_to_sg(iter, count, &sgtable,
-					      num_sgs - sgtable.nents, 0);
+		rc = extract_iter_to_sg(iter, count, &sgtable,
+					num_sgs - sgtable.nents, 0);
 		iov_iter_revert(iter, rc);
 		sgtable.orig_nents = sgtable.nents;
 	}
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 0362ebd4fa0f..223e17c16b60 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2227,7 +2227,7 @@ static int smbd_iter_to_mr(struct smbd_connection *info,
 
 	memset(sgt->sgl, 0, max_sg * sizeof(struct scatterlist));
 
-	ret = netfs_extract_iter_to_sg(iter, iov_iter_count(iter), sgt, max_sg, 0);
+	ret = extract_iter_to_sg(iter, iov_iter_count(iter), sgt, max_sg, 0);
 	WARN_ON(ret < 0);
 	if (sgt->nents > 0)
 		sg_mark_end(&sgt->sgl[sgt->nents - 1]);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index a1f3522daa69..55e201c3a841 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -301,9 +301,9 @@ ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 				struct iov_iter *new,
 				iov_iter_extraction_t extraction_flags);
 struct sg_table;
-ssize_t netfs_extract_iter_to_sg(struct iov_iter *iter, size_t len,
-				 struct sg_table *sgtable, unsigned int sg_max,
-				 iov_iter_extraction_t extraction_flags);
+ssize_t extract_iter_to_sg(struct iov_iter *iter, size_t len,
+			   struct sg_table *sgtable, unsigned int sg_max,
+			   iov_iter_extraction_t extraction_flags);
 
 /**
  * netfs_inode - Get the netfs inode context from the inode
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

