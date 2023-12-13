Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLE246VQMGQE33L53FQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id F4090811676
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:26:37 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425bb839c95sf65708291cf.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:26:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481197; cv=pass;
        d=google.com; s=arc-20160816;
        b=NwXxStOkSAoZmTzTQQ2Nh9iyW29VDd71PkAYSPkJV3EySMzq77I2HJT+3YDuOjYlA1
         VQWK+gBp1LcVO6gH2QwFhuKprACs4GAZik0SJUo9wQvTw+rxxNJLy8sdI3xdOjOijDW2
         vnC08ofSve3urHM7fUMS3jxeN7bqpjpTiL8q1xT2iFPITjU9rEmYOczZtKqTxScyFaIM
         QbFMV2y3Dfz09l+2Oa9BaBOp8VYAIqZurcgR9dGalhhCD1Z+JRI7EhVsT6C27Uv4jb/J
         tFKPih0jWTxI59jn91NRFTQAwBVlMgIL6ft03PSaPXN4u3fzPgIZSiQH47W/tLhEZSar
         4OtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=1R0TrNxz7M2Hh8qoPhDMUAkpw1jXH9o987L3bsK4WL8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Cq3vU7VHTjAlDreDYr2aD1V4DkbsiMKiXuLYEGT1zIu5xsiqYF2c63iwgzn0KJdLA3
         tvGvcA8Hc/xCKuBd2qmvE3zgaezqjCBlF4cBOlNT8fBMmhZS+pB7OWRVc1+oi0XAiXiq
         dkrUbstz5MXOZGApLdPl946uBSKUB5G6SaInib3IULSZXkkyQn8SQli64JahadVOeawJ
         rgSdeRRzX+BEYo1wuRl3gsw3tce1aVdIcHfx6Tj8vZd4PkmkCd0VWDfUcalG7XK9vCr5
         /2h66HX3WrB35O5KaltB++ox885AkSA6+qn/B15IkBqxn2YnixZZX/bwfDSpNBRpvy0L
         SIEw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481197; x=1703085997;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1R0TrNxz7M2Hh8qoPhDMUAkpw1jXH9o987L3bsK4WL8=;
        b=WupeU0B1xdcNJHpPdwGgEHIRJ4j/20j1mmUQCkffjLgys+6E5xlasaR8acVbrVFDhJ
         CfU/AfXYw3KEF2r9KpbiVwdBpnxsMBRa/ePiGdMVhUyFj7e0uVEHnjsLTpnvilO38bs6
         0Grdxix/I3zwijwGB7YpjlYNfkHpCV+S9pGdA55959px2HeOeiZk4EH8lcU2LrUnDBvl
         BUymvRe21vktxMNKWEMAs6Fuq9ZePsQG2G/Bfs6EOuiNUd67rHlXD//YZxyHSVEJ0z6i
         5jBytTZNTvQIt3XvAZlwfdrUPUM/8dUhtd6TzpN/WnIvQD+2FeBZ61nCCcxWFQy0AY1F
         k9Ww==
X-Gm-Message-State: AOJu0YxgFUiYY0rBir/sbZvhhCavdNr8bc24HSk9+GIAZ3KOIX0r90iI
	xubTozCGaOMCEGh44HqaM5aGJg==
X-Google-Smtp-Source: AGHT+IG2VoFYQ10rpBx1ahAY7fxONC7mGbtxup2R+Dp0eoJwvrA89Or/08zmwb5+nfGRMyeCPeo9Kg==
X-Received: by 2002:a05:622a:1b9e:b0:425:8eb8:ea82 with SMTP id bp30-20020a05622a1b9e00b004258eb8ea82mr12719013qtb.55.1702481197005;
        Wed, 13 Dec 2023 07:26:37 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:423:7e09:49c8 with SMTP id
 a17-20020a05622a065100b004237e0949c8ls556720qtb.1.-pod-prod-00-us; Wed, 13
 Dec 2023 07:26:36 -0800 (PST)
X-Received: by 2002:a05:620a:4007:b0:77f:6ef0:5f2e with SMTP id h7-20020a05620a400700b0077f6ef05f2emr9945449qko.25.1702481196506;
        Wed, 13 Dec 2023 07:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481196; cv=none;
        d=google.com; s=arc-20160816;
        b=NzCIxRNRCCtkiJlUUGhW8S9j0kCask6y38My2iHyaInK2ZfTX1Jc5uP38n4nAJjLXI
         GNiECTJVYxLZKOHYjLq373HhrlAaTMkBsHRVZMzsZiFpGg5tRVwJQab9wBvUvKwdPDTH
         +vLOw05ceFCDKnUonEnOWgXzTxe3cODxL/cLRXgIWaTBaKLomGP7Rw7Ci8U6L/UYpCev
         PReqDsL1zmccn1EgsQIyeR2IQE2xVcE1JlJjVIkBgojnxRKLOZ2XjiwNDqUTQOoizaqP
         e1Zj+eo+79//hDPvx1pZor0hbIN3de6qUyBwF0hmbW1WD/wL23rJV2qB5MEqwcNJGVlQ
         5uvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=rsXVY8tpr/E9yMFTv2Ypl/L7pV1HZSNyLiZDFqk/Fm8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=PdjLg8v/ioYDCU9DbfBia8ImIQga57HZ83nBWf0hJiBgUKqoNEjHdRdxNHqcJnAdqd
         brstFao93SKsn6UTleMUpFWYE49Kzyfhf9Z01nUP56vKGTjG/q52yKA54jRNkbVlwszl
         bMu7QPT93Uud9QFWSFMGjEGbElFvb7dKp/JrFX06BA24/b4zYUhSyn/MVIjQ+QHDMdou
         blL4TUTm5bnBcgAJ2jjVlRWISoBu/X67/vSAqxeAL78ZA235Vj1vcMcztOmpziue7Oj0
         8QEflAn3e8/JVrvdrBgoxJ9QFPNe/WhncjE5unP3gN4NZK4cIOej3kpYm+LbsmjithIX
         CIGw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 5-20020a05620a048500b0077f75db3d0dsi7063308qkr.702.2023.12.13.07.26.36
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:26:36 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-ibwrpjA2N4WcnyK5Uy4iCA-1; Wed, 13 Dec 2023 10:26:34 -0500
X-MC-Unique: ibwrpjA2N4WcnyK5Uy4iCA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EEB985A58E
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:26:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8C419492BC8; Wed, 13 Dec 2023 15:26:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31312492BC6;
	Wed, 13 Dec 2023 15:26:31 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 35/39] netfs: Provide a launder_folio implementation
Date: Wed, 13 Dec 2023 15:23:45 +0000
Message-ID: <20231213152350.431591-36-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Provide a launder_folio implementation for netfslib.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c    | 74 ++++++++++++++++++++++++++++++++++++
 fs/netfs/main.c              |  1 +
 include/linux/netfs.h        |  2 +
 include/trace/events/netfs.h |  3 ++
 4 files changed, 80 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 42f89f8ea8af..8e0ebb7175a4 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1122,3 +1122,77 @@ int netfs_writepages(struct address_space *mapping,
 	return ret;
 }
 EXPORT_SYMBOL(netfs_writepages);
+
+/*
+ * Deal with the disposition of a laundered folio.
+ */
+static void netfs_cleanup_launder_folio(struct netfs_io_request *wreq)
+{
+	if (wreq->error) {
+		pr_notice("R=%08x Laundering error %d\n", wreq->debug_id, wreq->error);
+		mapping_set_error(wreq->mapping, wreq->error);
+	}
+}
+
+/**
+ * netfs_launder_folio - Clean up a dirty folio that's being invalidated
+ * @folio: The folio to clean
+ *
+ * This is called to write back a folio that's being invalidated when an inode
+ * is getting torn down.  Ideally, writepages would be used instead.
+ */
+int netfs_launder_folio(struct folio *folio)
+{
+	struct netfs_io_request *wreq;
+	struct address_space *mapping = folio->mapping;
+	struct netfs_folio *finfo = netfs_folio_info(folio);
+	struct netfs_group *group = netfs_folio_group(folio);
+	struct bio_vec bvec;
+	unsigned long long i_size = i_size_read(mapping->host);
+	unsigned long long start = folio_pos(folio);
+	size_t offset = 0, len;
+	int ret = 0;
+
+	if (finfo) {
+		offset = finfo->dirty_offset;
+		start += offset;
+		len = finfo->dirty_len;
+	} else {
+		len = folio_size(folio);
+	}
+	len = min_t(unsigned long long, len, i_size - start);
+
+	wreq = netfs_alloc_request(mapping, NULL, start, len, NETFS_LAUNDER_WRITE);
+	if (IS_ERR(wreq)) {
+		ret = PTR_ERR(wreq);
+		goto out;
+	}
+
+	if (!folio_clear_dirty_for_io(folio))
+		goto out_put;
+
+	trace_netfs_folio(folio, netfs_folio_trace_launder);
+
+	_debug("launder %llx-%llx", start, start + len - 1);
+
+	/* Speculatively write to the cache.  We have to fix this up later if
+	 * the store fails.
+	 */
+	wreq->cleanup = netfs_cleanup_launder_folio;
+
+	bvec_set_folio(&bvec, folio, len, offset);
+	iov_iter_bvec(&wreq->iter, ITER_SOURCE, &bvec, 1, len);
+	__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
+	ret = netfs_begin_write(wreq, true, netfs_write_trace_launder);
+
+out_put:
+	folio_detach_private(folio);
+	netfs_put_group(group);
+	kfree(finfo);
+	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
+out:
+	folio_wait_fscache(folio);
+	_leave(" = %d", ret);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_launder_folio);
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 9fe96de6960e..8d5ee0f56f28 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -33,6 +33,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READPAGE]		= "RP",
 	[NETFS_READ_FOR_WRITE]		= "RW",
 	[NETFS_WRITEBACK]		= "WB",
+	[NETFS_LAUNDER_WRITE]		= "LW",
 	[NETFS_UNBUFFERED_WRITE]	= "UW",
 	[NETFS_DIO_READ]		= "DR",
 	[NETFS_DIO_WRITE]		= "DW",
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index ef17d94a2fbd..a7c2cb856e81 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -227,6 +227,7 @@ enum netfs_io_origin {
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	NETFS_LAUNDER_WRITE,		/* This is triggered by ->launder_folio() */
 	NETFS_UNBUFFERED_WRITE,		/* This is an unbuffered write */
 	NETFS_DIO_READ,			/* This is a direct I/O read */
 	NETFS_DIO_WRITE,		/* This is a direct I/O write */
@@ -407,6 +408,7 @@ int netfs_unpin_writeback(struct inode *inode, struct writeback_control *wbc);
 void netfs_clear_inode_writeback(struct inode *inode, const void *aux);
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp);
+int netfs_launder_folio(struct folio *folio);
 
 /* VMA operations API. */
 vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 914a24b03d08..cc998798e20a 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -25,6 +25,7 @@
 
 #define netfs_write_traces					\
 	EM(netfs_write_trace_dio_write,		"DIO-WRITE")	\
+	EM(netfs_write_trace_launder,		"LAUNDER  ")	\
 	EM(netfs_write_trace_unbuffered_write,	"UNB-WRITE")	\
 	E_(netfs_write_trace_writeback,		"WRITEBACK")
 
@@ -33,6 +34,7 @@
 	EM(NETFS_READPAGE,			"RP")		\
 	EM(NETFS_READ_FOR_WRITE,		"RW")		\
 	EM(NETFS_WRITEBACK,			"WB")		\
+	EM(NETFS_LAUNDER_WRITE,			"LW")		\
 	EM(NETFS_UNBUFFERED_WRITE,		"UW")		\
 	EM(NETFS_DIO_READ,			"DR")		\
 	E_(NETFS_DIO_WRITE,			"DW")
@@ -127,6 +129,7 @@
 	EM(netfs_folio_trace_end_copy,		"end-copy")	\
 	EM(netfs_folio_trace_filled_gaps,	"filled-gaps")	\
 	EM(netfs_folio_trace_kill,		"kill")		\
+	EM(netfs_folio_trace_launder,		"launder")	\
 	EM(netfs_folio_trace_mkwrite,		"mkwrite")	\
 	EM(netfs_folio_trace_mkwrite_plus,	"mkwrite+")	\
 	EM(netfs_folio_trace_read_gaps,		"read-gaps")	\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

