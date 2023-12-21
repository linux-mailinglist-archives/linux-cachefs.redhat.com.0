Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7PZSCWAMGQEVTUNMFQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F181B781
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:26:22 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dbbe987e72sf43255a34.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:26:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165181; cv=pass;
        d=google.com; s=arc-20160816;
        b=exDCm1cXJycpsGpfq/ypk4EHQDN8daKKP2qrBdNnP2cL2H/r1oPzP3II1H/SalruVV
         ExHRUwhKjQWll5urjfd3JJk6XWAXEVIG9r4OuXMQwWg/k8Xeo4fjandVSdq93GTSnkZ0
         b4uItvTLr+srFo6+/8xZvEucWO+yhH86uzsA/7EiYiLCMNxUO8Khy03+KNxkeWD5T3WC
         ZYPEaAmMTVrY8cXLatwQBga/4volvf6J9/Ja4fo1jrA9XHToLXjlFk2MnjEaf1duYU0X
         xxUqUs16xLIIaPzhy+L6+2kL6AEinSWVIPelh2PanosZPqdoEci7dTnSPPRQhV4ll03A
         fkPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Mi6eWwTHEM0EUvjl9SQ4mTsERKfe8netGrAN+juoqNE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Vebec7O09N5Wu1V5z+A2R2+lT21Skc8BxCe0c8cdVe25JRjIYct2AJ96oJfS7JMUQK
         EDePlCwNK/Py+4BZKFtPSvNGIm1giRrzwk9lEztd5gkQAoHihs4uQRv3W06P8EWkGOFR
         gYDTNDCXDsgph8mpOjeawLUfI3Tt9XJS6a7OoRbdxx0vYLd+atKpjhYAKLMo2OVvsDsj
         Q0RhroOJ+xLbpU/5C9Yvl5m/JFzNhPN1c4QytZQwgPO2TW0LuV9itvT8285ioISA6rGt
         54eKmb67pKUiWgA7qXhiQYh0sNPNua8DNOfdq+7/1rzaIVGiqDU64Vggi6m8C0287/YM
         zNdw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165181; x=1703769981;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi6eWwTHEM0EUvjl9SQ4mTsERKfe8netGrAN+juoqNE=;
        b=gzF1iVzhkVwb+69heqYFC0X09Zrwx+O2QYCnecqi4rO2wCRSA29FPLWS9aXF5sW1iy
         tKStLgGeUlCzuhNUT2gvWiq3M1+Tzdb+2r0QowflmN6Ixk+83RWtZtDuOHEXtNGB7L86
         9geDPU59e7Rq5sd+XpgKhaLZOfPlqc7kcspMoxtIFEhFrHi0CipCF9mgIgAwgPuDbxzM
         OA/1X9PwoXtshXQsh02hj+F0t1ZidrVs8DyRgLH5GoSrYO+4iglsq3fLc2Tmon7UCqvC
         DwmyR6KZJjZPRXlCLn1tsx9B3F4T8eFzCcKh7gMpKdB/+XB2H7XUDsSTP1wP+4TYgtrR
         k69A==
X-Gm-Message-State: AOJu0YxLL5wIGk1GtnjCnme52SD6pXbZNCLNHyYFOwd4A0/7KvTG/v1a
	pGuwau8N1SONKY6SSvCllen+Wg==
X-Google-Smtp-Source: AGHT+IG4UNn6g23GyoG+v493JVEo586QC0TsWejnoKVgG1I9a/8j4XLOfUxzSpPif5S1F5hncrkySA==
X-Received: by 2002:a9d:7ace:0:b0:6d7:d4bd:1fca with SMTP id m14-20020a9d7ace000000b006d7d4bd1fcamr17672201otn.17.1703165181346;
        Thu, 21 Dec 2023 05:26:21 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:470e:0:b0:427:8fb2:d1b7 with SMTP id f14-20020ac8470e000000b004278fb2d1b7ls1216482qtp.1.-pod-prod-02-us;
 Thu, 21 Dec 2023 05:26:20 -0800 (PST)
X-Received: by 2002:a05:620a:2989:b0:77e:ff8a:3a56 with SMTP id r9-20020a05620a298900b0077eff8a3a56mr25066839qkp.102.1703165180708;
        Thu, 21 Dec 2023 05:26:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165180; cv=none;
        d=google.com; s=arc-20160816;
        b=Tc3yM6BqedfuFPAZpBicImmWgrYCCeUxRNwvNIHP+KNFFVN1diDm1YnCxRwB7vx1SO
         t1d2lV+hBqmCha7LqgFTsYDFF7cmbdtuBG5ovs1E47z66MoyboAwfFUFeZc4oIcoBfhw
         koCzVVIuqJl0sk+Ns4iERwG1gHl7AAzw7jBvkc5DjCuOfwrxA21xWnvMboj+1bMHpohQ
         +NPyHC5rqLo0eg8jqTyDApKO25DoCn5VYtebzMMsLtC/KCqd30tWhNO1Zp3AKIlh5PIu
         K4VQSytPDH4eEdbqDeKHO0+D+lnuMcv12xjgn+g4jAGNpKzhieX5ahdGhcOWolkGd42O
         tUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5nrdy05+O63ty6kfCVxiUL3UOguYz/ZaMv4KyXdTrG4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=v/tS+vouWm2FOwdfVo/fAbLDqEUW/Eb4R6u9g4iHDp+lAgoOHfZfVa18dU354IzfUK
         JcxIZsgE/IHrPLDusjYu5qiATU61l9PzXKzh8nAIG4vJ2etge4t/+iR1W/edPWlsgOYq
         RCRoyL5Zpq1kz209NhTBa0TX4KJPOge7Jav4817TPe1MU0XLhLdWVD2/KgockvXXl3p1
         2iPMQIv16H/Ybx+Z9Qg5DOnspykf9+G1qYi8mnwqlpx9SsUBgA0tGf/odW2/Igei/Pbg
         EPu0LQESKVQvqyGx6n/mB2a5pyCbI08eWjZZ186btUJYi+NZ5Qtq6dikiOdBkJnOdNLW
         OgjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id m18-20020a05620a221200b0077dabbe1b27si2131424qkh.196.2023.12.21.05.26.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:20 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-bOIRV_fFPA2vREF9OFmg_w-1; Thu, 21 Dec 2023 08:26:19 -0500
X-MC-Unique: bOIRV_fFPA2vREF9OFmg_w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00A1088CDCC
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:26:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id F01A7492BFD; Thu, 21 Dec 2023 13:26:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03196492BE6;
	Thu, 21 Dec 2023 13:26:15 +0000 (UTC)
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
Subject: [PATCH v5 35/40] netfs: Provide a launder_folio implementation
Date: Thu, 21 Dec 2023 13:23:30 +0000
Message-ID: <20231221132400.1601991-36-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
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
index c078826f7fe6..50be8fe3ca43 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1111,3 +1111,77 @@ int netfs_writepages(struct address_space *mapping,
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
index 8e4db9ff40c4..473f889e1bd1 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -30,6 +30,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READPAGE]		= "RP",
 	[NETFS_READ_FOR_WRITE]		= "RW",
 	[NETFS_WRITEBACK]		= "WB",
+	[NETFS_LAUNDER_WRITE]		= "LW",
 	[NETFS_UNBUFFERED_WRITE]	= "UW",
 	[NETFS_DIO_READ]		= "DR",
 	[NETFS_DIO_WRITE]		= "DW",
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 71a70396c2f9..3413d06033ed 100644
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
@@ -405,6 +406,7 @@ int netfs_unpin_writeback(struct inode *inode, struct writeback_control *wbc);
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

