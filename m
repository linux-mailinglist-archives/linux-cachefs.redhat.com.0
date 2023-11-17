Return-Path: <linux-cachefs+bncBDLIXLMFVAERBF5R36VAMGQEGI3EO3Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DE7EF9C9
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:17 +0100 (CET)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1f5acc3dcf2sf968988fac.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255896; cv=pass;
        d=google.com; s=arc-20160816;
        b=zi3JhqTwIdqDRyj929Czd7f32NeHudx9FZ3m4SqaFFuRaaYb4qBAMegNS23hD974Yg
         jbKwWuJKvDNEUwN9KxWwSDNi/OpRR1Q1Nym1qQMSbM8YH6BLCPKYA+zoFU0RazAl85+l
         8QQDmy3tWXw7SsX8ZQeiAYTKYlznOoHMiiqyLXIS+OR1pVGtbSVG+iltgKxWrab45HXg
         Vy+uIRLSbjeHHnn4WMH9TbN/qQBsArhS1u6l5WefOZESHQIt4kNTdXJK7DYzSXp5U8qZ
         voRZVhN6LKsYOzinlmJfUnLNaz2rxkJkc9dCah9zIM2mCECzMhyadRUsLiM3jhOSSh2P
         C3/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ySsRh85icruIDLGwMqUFTY66CR7Knfwqg8ZOscHqoHs=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=DLm7MYrd+tNg4Gj9bbjr3HDIqfzrLUxJ5Tu/jBMO2sFqMermZhsqq19f/XSgAvN5dA
         Zn8wfPRoXLjqpJnyfGaSN+++f7/6FLrvZ7vWNOouRb2YD0vd+Kb074qRjsEsuKAyGd7o
         sJDhxV3Db5l+akhIe5RoK2vsUDuT8KsX4j+GdZ15EBqSpksghweVflMtNUABu119eN4k
         tXcF8kT2cWJOwxtt7sYGmQRk5j2tj1SqaYq4xeXpTwxZ+kNmSxBAFR/HG4EK/oEcExMD
         ez/DqhLFlXeF+RCtuiz9/0n7+w2lQOcBFiQmugJVVdHpvfvgeobteSFw49g22DzIyuGu
         h6ng==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255896; x=1700860696;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySsRh85icruIDLGwMqUFTY66CR7Knfwqg8ZOscHqoHs=;
        b=iZrs82lEvE3nCm1c2VovTHxyw4mpqQk4ySsybx7zuGa60AGST1NY8VkaLGeS5sBAfg
         osZwT6SOLJ1JADPslJo0kugDKqRGibeeJXCXBvaNQK+DP/F1KQ6jf6roWMNkf49m5Lcs
         ztmrd/ycp0C1rnRbGm8Xto+vmj4cQeH9k+Oyfr8hFhGnaFeFsIfQQZmetOXYQBBnjv5w
         Vaq1wLKIIt90bUer25PlJrOO1fmow2AzKYytQuFS/w3s/PloIpw/PzNt1QvBL/qdVRNW
         /a/XyOUITfliwuQLgZAYqoJNNoud54Zc35pMFUDxT2Vxxah45kDFkrxySwOly7KKcHQx
         BKTg==
X-Gm-Message-State: AOJu0YymmMoZ6hpM4TaCZJ/safz8IwrXGdtIe6T6HEJzEwrFfHvt+wkT
	mPJ3p+Vft8rJ5Ojr/3atTZux0w==
X-Google-Smtp-Source: AGHT+IGRl/DG4PxnAg/p+BPXVidKMNlTlgyEkGzvvONBgpL7WXOa0Gmr/oYNQk7ZTcMJ83iJcQsIag==
X-Received: by 2002:a05:6871:a593:b0:1f0:cc7:84c5 with SMTP id wd19-20020a056871a59300b001f00cc784c5mr379125oab.11.1700255895919;
        Fri, 17 Nov 2023 13:18:15 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6871:ae81:b0:1f2:9e6f:586f with SMTP id
 zs1-20020a056871ae8100b001f29e6f586fls2005249oab.0.-pod-prod-01-us; Fri, 17
 Nov 2023 13:18:15 -0800 (PST)
X-Received: by 2002:a05:6871:6181:b0:1f5:acbc:85f0 with SMTP id rb1-20020a056871618100b001f5acbc85f0mr463717oab.0.1700255895363;
        Fri, 17 Nov 2023 13:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255895; cv=none;
        d=google.com; s=arc-20160816;
        b=jbaJC6fLpE/heIJtBzCEjuA7HKQWTa8aum2IDymbB1aoUEikwwy3FM4n27RHu3u/MH
         z9iVSuSPFFkj6bwmWJ9jaj3EYdpmzcbF32Q+WqzaMjyvdqNK3K9X8J/ZbfUnU/bmrmpg
         zfET+JXF/g4HAwfmlLmb74m0Bb51pOlFQ/bQihuHfBnnCWXTYAKVkrMSdv9WZod7P+ek
         6xT2PxjcW+78B02teZm5HXuNR8rSafNINohBEz+8436gTV5ckKvZ9Xs4BbWA7QsRbD3R
         Z1rgh+MeMr78lGs+cM1BFSnGNd3BD8gAfysnmGOc0f4B2B+psBPmph+Wej6DgYyuB8za
         BbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=hzDhN/w9cvvKua4gBrl6PWgKrwY4TekGMNM6JSQn30M=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=npXtBYWQsKLswnF549xb/tdwYnpMP/A3DGQ2wWl3SlZms/kfQD1EqDZQPOb970JBAW
         fdjMteoCyFpL2wcGPGNXK86ud5Gf/VprHYKLt2RJNzmYYXqImZdn1GMmaxV2I1WniQen
         uk0wc4G3+O3M89W13A6ZgIePYzxwJz5rRg2jkuCN9/W5CY2lttO/s4fK4+pAHt/GlIud
         GqcTM6iHqJs4cdUqqwfoJfRB44c7c0To36qxyWHNFrdYRbFNB4OCX4CocSxUJoSxctq1
         mn+NMvyOli+lZWNev/SneAWYFxdHtnYfT8xWphF8nRc3lQAF/s4ue4BsydpAMFIehLVo
         BUJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id k10-20020ac85fca000000b0041cc795c5e3si2442866qta.759.2023.11.17.13.18.15
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:18:15 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-IWCH6cAjNj6rIeZ2ohZX4Q-1; Fri, 17 Nov 2023 16:18:13 -0500
X-MC-Unique: IWCH6cAjNj6rIeZ2ohZX4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B91F8527AA
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:18:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8845BC15886; Fri, 17 Nov 2023 21:18:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAC44C15881;
	Fri, 17 Nov 2023 21:18:10 +0000 (UTC)
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
Subject: [PATCH v2 37/51] netfs: Provide a launder_folio implementation
Date: Fri, 17 Nov 2023 21:15:29 +0000
Message-ID: <20231117211544.1740466-38-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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
 fs/netfs/buffered_write.c    | 71 ++++++++++++++++++++++++++++++++++++
 fs/netfs/main.c              |  1 +
 include/linux/netfs.h        |  2 +
 include/trace/events/netfs.h |  3 ++
 4 files changed, 77 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 93e16f7caf67..43e825b882ff 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1099,3 +1099,74 @@ int netfs_writepages(struct address_space *mapping,
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
+	struct netfs_folio *finfo;
+	struct bio_vec bvec;
+	unsigned long long i_size = i_size_read(mapping->host);
+	unsigned long long start = folio_pos(folio);
+	size_t offset = 0, len;
+	int ret = 0;
+
+	finfo = netfs_folio_info(folio);
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
+	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
+out:
+	folio_wait_fscache(folio);
+	_leave(" = %d", ret);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_launder_folio);
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index b335e6a50f9c..577c8a9fc0f2 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -33,6 +33,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READPAGE]		= "RP",
 	[NETFS_READ_FOR_WRITE]		= "RW",
 	[NETFS_WRITEBACK]		= "WB",
+	[NETFS_LAUNDER_WRITE]		= "LW",
 	[NETFS_RMW_READ]		= "RM",
 	[NETFS_UNBUFFERED_WRITE]	= "UW",
 	[NETFS_DIO_READ]		= "DR",
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c3d1eac1ce51..474b3a0f202a 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -234,6 +234,7 @@ enum netfs_io_origin {
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	NETFS_LAUNDER_WRITE,		/* This is triggered by ->launder_folio() */
 	NETFS_RMW_READ,			/* This is an unbuffered read for RMW */
 	NETFS_UNBUFFERED_WRITE,		/* This is an unbuffered write */
 	NETFS_DIO_READ,			/* This is a direct I/O read */
@@ -423,6 +424,7 @@ int netfs_writepages(struct address_space *mapping,
 		     struct writeback_control *wbc);
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp);
+int netfs_launder_folio(struct folio *folio);
 
 /* VMA operations API. */
 vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 825946f510ee..54b2d781d3a9 100644
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
 	EM(NETFS_RMW_READ,			"RM")		\
 	EM(NETFS_UNBUFFERED_WRITE,		"UW")		\
 	EM(NETFS_DIO_READ,			"DR")		\
@@ -129,6 +131,7 @@
 	EM(netfs_folio_trace_clear_g,		"clear-g")	\
 	EM(netfs_folio_trace_filled_gaps,	"filled-gaps")	\
 	EM(netfs_folio_trace_kill,		"kill")		\
+	EM(netfs_folio_trace_launder,		"launder")	\
 	EM(netfs_folio_trace_mkwrite,		"mkwrite")	\
 	EM(netfs_folio_trace_mkwrite_plus,	"mkwrite+")	\
 	EM(netfs_folio_trace_read_gaps,		"read-gaps")	\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

