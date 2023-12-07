Return-Path: <linux-cachefs+bncBDLIXLMFVAERBE7QZCVQMGQEFUXVDOI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 47780809390
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:36 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42599db593fsf6999641cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984275; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZI6OLUhsRH2RtaROaadjkTCnhkTwqhwe2wHndSX8y1wsOdzRBhGMnMuW2uB7vEQydO
         r8BeWOZ16gJi7v6SeaEX4fb1wQWqCPeSGIjnhb8PW/BQougZ//lt1falX12AXsIMFiZO
         KvVh1PWHV2Fd2SytVrAZA/lh6EmrDvjSULJ7V/yBbQogTruyWx1YC6LNhQeqVnZtx+Xj
         5LlsAnmCf1zshgSkx7ozzmmg7BNjApY02ug9CH+bRF4PlFbE3lUIsyPCSyTMMCornwD3
         YvqON+HnfS6syfAJqvLCql3lbTh8WjmUYHDqudNrXa702vucSm1dZ5ZUmFJiBUzLgkm3
         PCvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=wi5S48elc/KUkvhb07LqWj60XYEjvewI0qNkEZ1VgVI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=mZ2VC9yOIrDYCY7gNw4EJKCEQbpSCz18Y+SIe8G+ZCqjQEFpPGQiZn7vJ3BZ5Mw1Ll
         zaSqww5ng3DqWBGvvGBBpHGblub0gawDVL2NUZ6bn0C0nluaqm6Nh+Q7JP4wrNO1jBBp
         w5IGRZ8LsvAndc9qudMorpAyOXDm/5LoPTq+rlLWl/qPEa81Yg9844XKzmXfHZkOEYs8
         vqkFkPZoNqFBnyzcSw+dddYErFIWA/fqpsUspwPju0kz+XsVaHyYTzqHZ7oTikSQv0qO
         SzqDuluSKc66ebKafZWHclzK4fzAqtdBELDIJt+Gu51pXUAnkeI5467ONBS6rxd3seZ8
         poig==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984275; x=1702589075;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi5S48elc/KUkvhb07LqWj60XYEjvewI0qNkEZ1VgVI=;
        b=fEFMmJzpuBLp0h5zGwOdEtXl3gkvNLJAWacTxX8cLoQEOee8zHd2OUZ8QfRgREpCYP
         PC0JIu7D8ByISmLvZ5kWGdcLvrskl2j6KOUoIlpu9Z1Gw8bn9ODzW0xBkilLjbWOFpB4
         BjCOEAbJlwOujpJx2fMPMAWrWNcb6/veqvlwtSNc44KuuAfxIqJ1mOScEGihkYg9jSys
         m15AMviYxHcJhRwkpqlslcOMpICxlkMpr7jMIaSK4tcxlBACIfHeEF6BVjODiNfaO9Bj
         V8rye/vOoiHkqyFwXThDqtS6G9O7GAZH0nk+Z4DvioJIBKnsZoi+2Rf1GzLivzDsQh2p
         oLZQ==
X-Gm-Message-State: AOJu0YzLqsK+r4uJoG2pW5kca3t85udfD/kxHpMOKg94et07K6xXpU7Y
	iMs8caWEsnw+om0fJpPKtGinkA==
X-Google-Smtp-Source: AGHT+IG5ji1XOXB1BVJ+NMQus/pPaiP4fqkOx4kPqO8uMsUf4O6Y51d0RBKq7ZPn9PuocsLLlM1PLQ==
X-Received: by 2002:a05:622a:1a03:b0:423:9a04:a37 with SMTP id f3-20020a05622a1a0300b004239a040a37mr7615487qtb.16.1701984275269;
        Thu, 07 Dec 2023 13:24:35 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:423:7e09:49c8 with SMTP id
 a17-20020a05622a065100b004237e0949c8ls2654897qtb.1.-pod-prod-00-us; Thu, 07
 Dec 2023 13:24:34 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:77e:fbba:6466 with SMTP id bp43-20020a05620a45ab00b0077efbba6466mr2852638qkb.69.1701984274749;
        Thu, 07 Dec 2023 13:24:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984274; cv=none;
        d=google.com; s=arc-20160816;
        b=dfVn4e7/FBhczomJb+9eMHX2HZQoEEm003eSy5B/RG5ZfS0mDzmmU5IYTp5jE0XiFW
         Y9YN06HCYvNhsyUIshFHn3a1sS1SuszvcnSajT9S860ksTtb+tTFMEbxf6KkkurKs8s6
         wCoLGzNp2skybNt8N9C+ygLRjYK/o/gLI92+ZiYRVsRgygbNODZ8qOBbxQATfMzrHOUD
         WI+pUglUDOpweDkekPzGyggua2T555kpZ9LZV57DwDE6nniADAPMzT9Hnq+6djdYnegT
         +iBTCe5xe4ZNAfBjPGqmjta4pAxl3eIncmzwne/x8bEfD89uadvQWZaKAYabQAs+E19L
         G+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9oRWOG0JX+9+yoH06vzJgnUfC3KUfaJZ4qcRVrSdfAE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=AW6YZFp+1R3DgjRZYPcEo4EwaKRznEXCSFdHUazpGb6p62A0h3LIwhd0J/GZHrlrYy
         kUczGeLOqKClTdp7KWCYOs6q3SY2AvD3JpW32maVKkLDoHwCBX0Xk93rdsRhJrklPLsD
         alUjdRigiuD03qUDwbujtVkjfm64EJmW5j6PuUzr9fVZkiGBCV0hOwoNHkwPYs/SvtdC
         7Gf5nL9CakNORxnVLYI3Z33A7/wpl5pQg2UKLxTNMOl2UaMKY/g0ZSaqFjK3aD85FBrl
         UgC3MZ80+HrJ6vs3mMhd/JsffjSHAJemEX/aZlFRLEQqnRTx+KbT//6ZyNhAIodPaPyw
         PYUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id e11-20020ad4418b000000b0067a3a4e3b89si636472qvp.140.2023.12.07.13.24.34
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:34 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-ZW90cYvAN1Km5z5n-iAM4g-1; Thu, 07 Dec 2023 16:24:32 -0500
X-MC-Unique: ZW90cYvAN1Km5z5n-iAM4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 547AA85A58C
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5178A492BCF; Thu,  7 Dec 2023 21:24:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B000B492BC6;
	Thu,  7 Dec 2023 21:24:29 +0000 (UTC)
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
Subject: [PATCH v3 41/59] netfs: Provide a launder_folio implementation
Date: Thu,  7 Dec 2023 21:21:48 +0000
Message-ID: <20231207212206.1379128-42-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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
index bffa508945cb..a71a9af1b880 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1124,3 +1124,77 @@ int netfs_writepages(struct address_space *mapping,
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
index 122264d5c254..1e43bc73e130 100644
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
index a9898c99e2ba..5ceb03abf1ff 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -232,6 +232,7 @@ enum netfs_io_origin {
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	NETFS_LAUNDER_WRITE,		/* This is triggered by ->launder_folio() */
 	NETFS_RMW_READ,			/* This is an unbuffered read for RMW */
 	NETFS_UNBUFFERED_WRITE,		/* This is an unbuffered write */
 	NETFS_DIO_READ,			/* This is a direct I/O read */
@@ -424,6 +425,7 @@ int netfs_unpin_writeback(struct inode *inode, struct writeback_control *wbc);
 void netfs_clear_inode_writeback(struct inode *inode, const void *aux);
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp);
+int netfs_launder_folio(struct folio *folio);
 
 /* VMA operations API. */
 vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 4dc5fcc7b0a4..94669fad4b7a 100644
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
@@ -132,6 +134,7 @@
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

