Return-Path: <linux-cachefs+bncBDLIXLMFVAERBBW2XOWQMGQEAVFVLZI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624B83761B
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 23:32:40 +0100 (CET)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5efe82b835fsf60565277b3.0
        for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 14:32:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705962759; cv=pass;
        d=google.com; s=arc-20160816;
        b=HqQ5yJcG9VjhBTeemzs32FwtnTPsQmW8MTEEP2OB0cfO1o6+nF9vrpNc9hq1KG9Jjv
         SxggWQUa5LIaa42BjPdk0jKZp86W4e4PPvbWlBzo+8rESvmAO8ikouHs4YRxjsnFvwiM
         YY2hamckIHQtHh26FBVHc6kaeEeOCtgrkJ2jhoMsZEYuNgVP182WWIGjHRFxJvlcprPc
         HtsPiIZ+nOnPMNmxq8rVQgNDgfPEVEN1+IV0LXAZ84xytvOcWi6TWMhIFnh09JUp59wt
         NFmQLmf8LrfDaVnBhWaYSzrXxJsXy3f6Q3Pzr/TIsfmyGI25NG+8m4S3OoNk+5TflZfo
         +TvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=fN1vHSJ5PQf4uFWOR8LQ67K0YDdz4wygg3nyHTkOtNA=;
        fh=FnpNaEs7ZBq56/QlUA2bXulYV7BZWdOFZjGg77Ohe5s=;
        b=eGV30R1qSDtyWHWh10RN/2wCZZW63GsdqsbLiiev2ck16guXKyzndbGonVllEAvsjI
         jcTEUT4E4vimSxWSv3VLO97YNnMFtqck0URPC5tb2EUecDY9rEDk2vUPoJXeLQVgqJlw
         /J086GliHU/xn/1hkI2or8SZVyFqhF9HAlNCIG7uTQj3L76Iwqu+jj2INTH5Y5VEzhmj
         OOurMsLIGToFGbwEqD4nS+Ow3o5U6sMG9A08ybMMKBu6zPMnxMIKOwcichVcM5m9erqC
         klWw4FZ3C9nLW7TYY1C+Io75WlY0R8xnwKYgAuqYZxjkHl9x4RnbGxs4qdHhlP7DH5k1
         0oKQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705962759; x=1706567559;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fN1vHSJ5PQf4uFWOR8LQ67K0YDdz4wygg3nyHTkOtNA=;
        b=obv1uk3Vlwi3d0yPCFXiRXTd5gMZHyGCslKJHQK2ihtjwtn6dgAl+kToYcrMFf8wfk
         b3Cgz6cgU78PKP+c8j+Ra1Z9yiUv5BcV+OXh2JSemMDdbp5HF339jDuQRQeznQkrSr5c
         N6kcU39cF3mFZEw3PlJiN5Ke8n7ha8GzvTOJucync0xB/8/fpdfdDTX05yS+i3RN25sn
         AfFPHhroNzzyRbs3WffImxEoJGXRX4NVOYAxQZtmLf4HhhaENZ7uuiEZnrYx4yOQUimS
         jQrPVDSOYK+l14uZOgt91Sj0S8Bxj3dHjDynv/EY95AcMTjBa0tdCV/Bo32AeH9G/AUt
         6rdQ==
X-Gm-Message-State: AOJu0YwFEd3S4IGSJMzhomoyQ1eV+96ehAY7bYlRJnxJQ2tnvIzkvT6w
	/DxOdQd5V+SHPDsIcqMzFOVGClKgr1casNBXyab9w8ST2IYgYytKYQz3/ttBwU8=
X-Google-Smtp-Source: AGHT+IEFkU2urZrEuU+IPGk8lEKaA/2TVKpPP3r804FQjPYf2cUoE7aWgUYd9Vj9napYJHuopUPqoQ==
X-Received: by 2002:a81:7709:0:b0:5f6:cfc3:f5a3 with SMTP id s9-20020a817709000000b005f6cfc3f5a3mr3413029ywc.50.1705962758991;
        Mon, 22 Jan 2024 14:32:38 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:229d:b0:42a:21da:27e1 with SMTP id
 ay29-20020a05622a229d00b0042a21da27e1ls2861776qtb.0.-pod-prod-09-us; Mon, 22
 Jan 2024 14:32:38 -0800 (PST)
X-Received: by 2002:a05:622a:145:b0:42a:4236:d3f7 with SMTP id v5-20020a05622a014500b0042a4236d3f7mr2218242qtw.89.1705962758411;
        Mon, 22 Jan 2024 14:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705962758; cv=none;
        d=google.com; s=arc-20160816;
        b=xzspuWoWvSKM9M3/7MLKZDGreywt4g9+URczym1aOaxkaLkOlI5Z5b0/MpWRNwcIrP
         0i4xoWv5ugvdrrarMMePChmIYxfC0n7KvnfK8g6vduxRA7xIMD3smD6YwPKtyHkz6TrF
         RxGX2gTt31nr7lSGrpXCbAIeOXDx30UJHIj+ozOBPL/NTag9e/AreWd+1MAcFi3svXLO
         frtaxx5p+L7eJvEBbTikRpkyXTi2oVR5G11SkSNtgQv39lZ4709IiX9QppcMtHknAB9Q
         ZNtSnDH7eOJTKz2EdOctLTPkdYSLRgzNQymsLUWE9egs8UUtHsrPAPkOPdmMwDbFa/nW
         pWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ZMPTPTYWTetkbwHAgXIcAqcSHq6C+WaS/axDb6+0Ntc=;
        fh=FnpNaEs7ZBq56/QlUA2bXulYV7BZWdOFZjGg77Ohe5s=;
        b=fn8XzLbVQk/199GTdT03hWWr+84veJZXe5n6ApEWQ0GIeYh21ADUeIkyVcFO5Wr41A
         49n/LEPgRvLIdjbptjc7x92602G5XoUCYsYesglV3+x5g2xReVbHSSlsr4iaUStVlMK2
         a40N9JnJmHEGm5YQfayIn6+qAKdizlWN9/tq3tKtX1dGKh8yAghbYoTo5WUZwwKLUbiU
         4W0NDEysJRHQIm21vrcTiOuBOC6ViCRMOKFB/DmYukQ6QwYVpj/NIlvD/AtoVaEwzxl6
         WKyRH/PIFzE7jYXipdTx8OMJxwszsbmb/OnjVBAVgmGzy6QsVxOqcIiP3I9FRwRKK02T
         qtzA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id w31-20020a05622a191f00b0042a266c5902si6632435qtc.584.2024.01.22.14.32.38
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:32:38 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-tAsRvxi1PyyiBvZCFNkAqw-1; Mon, 22 Jan 2024 17:32:36 -0500
X-MC-Unique: tAsRvxi1PyyiBvZCFNkAqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88DB385A589
	for <linux-cachefs@gapps.redhat.com>; Mon, 22 Jan 2024 22:32:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 851662026F95; Mon, 22 Jan 2024 22:32:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A24DE2026D66;
	Mon, 22 Jan 2024 22:32:34 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	netfs@lists.linux.dev,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: [PATCH v2 01/10] netfs: Don't use certain unnecessary folio_*() functions
Date: Mon, 22 Jan 2024 22:32:14 +0000
Message-ID: <20240122223230.4000595-2-dhowells@redhat.com>
In-Reply-To: <20240122223230.4000595-1-dhowells@redhat.com>
References: <20240122223230.4000595-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Filesystems should use folio->index and folio->mapping, instead of
folio_index(folio), folio_mapping() and folio_file_mapping() since
they know that it's in the pagecache.

Change this automagically with:

perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/netfs/*.c
perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/netfs/*.c
perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/netfs/*.c

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/buffered_read.c  | 12 ++++++------
 fs/netfs/buffered_write.c | 10 +++++-----
 fs/netfs/io.c             |  2 +-
 fs/netfs/misc.c           |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index a59e7b2edaac..3298c29b5548 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -101,7 +101,7 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 		}
 
 		if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
-			if (folio_index(folio) == rreq->no_unlock_folio &&
+			if (folio->index == rreq->no_unlock_folio &&
 			    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags))
 				_debug("no unlock");
 			else
@@ -246,13 +246,13 @@ EXPORT_SYMBOL(netfs_readahead);
  */
 int netfs_read_folio(struct file *file, struct folio *folio)
 {
-	struct address_space *mapping = folio_file_mapping(folio);
+	struct address_space *mapping = folio->mapping;
 	struct netfs_io_request *rreq;
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
 	struct folio *sink = NULL;
 	int ret;
 
-	_enter("%lx", folio_index(folio));
+	_enter("%lx", folio->index);
 
 	rreq = netfs_alloc_request(mapping, file,
 				   folio_file_pos(folio), folio_size(folio),
@@ -460,7 +460,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 		ret = PTR_ERR(rreq);
 		goto error;
 	}
-	rreq->no_unlock_folio	= folio_index(folio);
+	rreq->no_unlock_folio	= folio->index;
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 
 	ret = netfs_begin_cache_read(rreq, ctx);
@@ -518,7 +518,7 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 			     size_t offset, size_t len)
 {
 	struct netfs_io_request *rreq;
-	struct address_space *mapping = folio_file_mapping(folio);
+	struct address_space *mapping = folio->mapping;
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
 	unsigned long long start = folio_pos(folio);
 	size_t flen = folio_size(folio);
@@ -535,7 +535,7 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 		goto error;
 	}
 
-	rreq->no_unlock_folio = folio_index(folio);
+	rreq->no_unlock_folio = folio->index;
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 	ret = netfs_begin_cache_read(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 93dc76f34e39..e7f9ba6fb16b 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -343,7 +343,7 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 			break;
 		default:
 			WARN(true, "Unexpected modify type %u ix=%lx\n",
-			     howto, folio_index(folio));
+			     howto, folio->index);
 			ret = -EIO;
 			goto error_folio_unlock;
 		}
@@ -648,7 +648,7 @@ static void netfs_pages_written_back(struct netfs_io_request *wreq)
 	xas_for_each(&xas, folio, last) {
 		WARN(!folio_test_writeback(folio),
 		     "bad %zx @%llx page %lx %lx\n",
-		     wreq->len, wreq->start, folio_index(folio), last);
+		     wreq->len, wreq->start, folio->index, last);
 
 		if ((finfo = netfs_folio_info(folio))) {
 			/* Streaming writes cannot be redirtied whilst under
@@ -795,7 +795,7 @@ static void netfs_extend_writeback(struct address_space *mapping,
 				continue;
 			if (xa_is_value(folio))
 				break;
-			if (folio_index(folio) != index) {
+			if (folio->index != index) {
 				xas_reset(xas);
 				break;
 			}
@@ -901,7 +901,7 @@ static ssize_t netfs_write_back_from_locked_folio(struct address_space *mapping,
 	long count = wbc->nr_to_write;
 	int ret;
 
-	_enter(",%lx,%llx-%llx,%u", folio_index(folio), start, end, caching);
+	_enter(",%lx,%llx-%llx,%u", folio->index, start, end, caching);
 
 	wreq = netfs_alloc_request(mapping, NULL, start, folio_size(folio),
 				   NETFS_WRITEBACK);
@@ -1047,7 +1047,7 @@ static ssize_t netfs_writepages_begin(struct address_space *mapping,
 
 	start = folio_pos(folio); /* May regress with THPs */
 
-	_debug("wback %lx", folio_index(folio));
+	_debug("wback %lx", folio->index);
 
 	/* At this point we hold neither the i_pages lock nor the page lock:
 	 * the page may be truncated or invalidated (changing page->mapping to
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 4309edf33862..e8ff1e61ce79 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -124,7 +124,7 @@ static void netfs_rreq_unmark_after_write(struct netfs_io_request *rreq,
 			/* We might have multiple writes from the same huge
 			 * folio, but we mustn't unlock a folio more than once.
 			 */
-			if (have_unlocked && folio_index(folio) <= unlocked)
+			if (have_unlocked && folio->index <= unlocked)
 				continue;
 			unlocked = folio_next_index(folio) - 1;
 			trace_netfs_folio(folio, netfs_folio_trace_end_copy);
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index 0e3af37fc924..90051ced8e2a 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -180,7 +180,7 @@ void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 	struct netfs_folio *finfo = NULL;
 	size_t flen = folio_size(folio);
 
-	_enter("{%lx},%zx,%zx", folio_index(folio), offset, length);
+	_enter("{%lx},%zx,%zx", folio->index, offset, length);
 
 	folio_wait_fscache(folio);
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

