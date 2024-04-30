Return-Path: <linux-cachefs+bncBDLIXLMFVAERBT7TYOYQMGQEXFRVN4Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CA8B77DC
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:52 +0200 (CEST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6a0e76b13fesf3411656d6.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485712; cv=pass;
        d=google.com; s=arc-20160816;
        b=TtLbNle+Uixdj+QFLRCHFL8NllrK5S/aObmC1ooNgLfuo8NMip3z4Cj0nhwnbNZxY7
         dN92Z+O+yTfnB33AvisuUeh/+lK1lnoYT0BDEysgEQGuObWLF6HXj0Rzzo2pa5pMOhDT
         n9AfDeuvctK63TmgG0tWh5sd5ojbfyUFhmeG6XxJdGESqeLqVIoExSatiVUhKjRj8084
         K4bTUgGcF5whFCWW/dkchCzgMRDdk7UhYRzVRtM7+Biy8PW31YI30cl0i1ktsy7Bo1nH
         u7Ce7e7sx6MViUpgLQD5mbMKbKf3tDFFxSUokVazsAmoeKqQQbebaH+ajN+N98A3fsBZ
         E6lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=FilSB7a/2dunF2ki40Vsx74WzqCqIQlvTl3C1mA92j4=;
        fh=ankupec5B1RaiXCdrhS72lyghRyYkWw+6NCemSiyeN4=;
        b=YT/6cu0urhtuQzDNZRYrOm971elCrLfaMGRPEzMg33zSY4+fqWI5xLWnrYfe0e77U/
         vRjSeYP7+J4Meoib0o9hR0e8CkOG5vouxckhhDdfdqbC66fyuqdfnThRvdccO0j+193x
         IBIId409j7+n1i+ZoLMO9zuUlwGJGuGWBRFiQl4nNWIKVo3m4sPByxdyEgl+rpbllstb
         mp8ag/e74WmUeaCgEY3mADSP7RXW4dspa7Vcg9kjj8H50FgwMMb27jjvVOjC74yAbPQs
         ZSwpcBwNlHY+jtvc24bETvggRbD5F33seMKBGszq/7s5RxsvNHnUdRWzTJUb+paX8XrW
         /Wiw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485712; x=1715090512;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FilSB7a/2dunF2ki40Vsx74WzqCqIQlvTl3C1mA92j4=;
        b=JjPpOZbqRvBZSNznkbgPVipnov64YNhXpDdVaZND0KKsJnSZ8xdv3rjmNnYwR0L2qv
         PPAKRDdQWc/kBmWLSE0MWrdnIKpn/p5656G/40juMcfjllVgG6bTc3aaAzgPhXTMVYjk
         KfHSiyuI4xzfTtO2u5jsAZNfsOX+Ug2ahvIQZQe/6HHWyelQfqd28PbqiJ8nW6INtsr4
         wI+zmN9aULW2IRMQVCCY+H/YH3qrxc0QoHHhbi8F8K3ccVStZzscpxbogwQyedFQep5h
         Hq8LjB2jE8XghbPWuYB1LbZTQl2QXzv1NeaSUipTUg01XVOffMSiar+Vgf8uXwaStXZ0
         TWTw==
X-Forwarded-Encrypted: i=2; AJvYcCXZXB0UY7tB7vrWq6YE67GgRV2QL1e2PKOAjOOHMn7qn9Fzmliqufu40gdsQj2LoHkSvcwcCtmpg9gsZr8fM+CNwjvVHd9rjEdELQo=
X-Gm-Message-State: AOJu0YwYnzTJXnZItq5p6WMnE1LeWiDTI9loIpJ4IGvfxeCpqsndu1dL
	+DxIyWd4FVLEB/YKKVaFaynNoAmEnS8a6N3xp2FAcmGH0Ut7egQ7OFvOdbv/GAY=
X-Google-Smtp-Source: AGHT+IGlmughr5fozrVTzjFSAQItHp0w3WN4nd0bx9pw7LnIJFIGOMpYKCbfQ+IdfYyoUFwzB3h7Gg==
X-Received: by 2002:a05:6214:21a2:b0:69b:2523:fcd3 with SMTP id t2-20020a05621421a200b0069b2523fcd3mr11110813qvc.60.1714485711661;
        Tue, 30 Apr 2024 07:01:51 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1c0b:b0:6a0:6ff5:70d4 with SMTP id
 6a1803df08f44-6a09c61d125ls56056276d6.1.-pod-prod-01-us; Tue, 30 Apr 2024
 07:01:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMvkzsWZopH0x5TVuVvMN07okDKPdAXUNk57TYznHHHQHSue3Omig9e3NDzyIZSHw9jN2LMgBD701g8pMxXxZaZ7p9ZYFEK/ZuRYSfmOY=
X-Received: by 2002:a05:6102:b12:b0:47b:b129:2890 with SMTP id b18-20020a0561020b1200b0047bb1292890mr14618915vst.18.1714485708962;
        Tue, 30 Apr 2024 07:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485708; cv=none;
        d=google.com; s=arc-20160816;
        b=iYBio+H0hfyhU3az40mTgyPnfKMt4cFGvvX4kW9SUkLk+bqtM9bAcvmtkRF744973o
         P3tnteH73JV++KdHnAFwnrsKsvR5yz7/TOI38oj+Z7hakD+osUhVaeZ4fCMJ69IfQ4yQ
         94H7Y5I/tbKsmTXncwBfaVxxvfN3WZtAPctEfZS66x3clbDIzT2h8R8z0+s79YQyOyCC
         kUdzGq5ppmQqsxiedBvStbPEkeKg1DdrcwpwYC0+WLawh7z1Pjlda0g4c04bSLZLhQRl
         /ECNtSaJ3TLdk6CaSF76tyg1bEnaD+16Xs4mOmuZM4kBSPBvo/BpRq7Phzf3y8p0QEbQ
         Oh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lxboyIOnAB/iBhiu6cMnQnAmXZl1NM4PiDGjMuEEdPE=;
        fh=3XhF/YurkuF37sFWXE1uIAu37ZbY1OMi9XJf1oPTKLg=;
        b=GLuOax8oy5tVpvPx78czWaw+3MZf5/HOWalmTTO0Awg7Kp/wc9j6wA7NIPWnEQyz3h
         E/QjgC/JAlo6nB8hcCWCMdLhB3y2/EhP1RP+G/lmeKToCwM/4wMvlZZPPkN80gNtPNyW
         HIUNMo2rLxjf98a44jEu5OKYzO1CF1P52hcGOuPj6JzwMI2DA4BhlUoEYBoTT0q2zNV5
         i2nCAOAGbwL2F8z+PD2Rkbvc1RctZgmjWC9ruX8MQbRXuGym0EtgpwiSarCBIALf6+EG
         wLXqbBqmllK0UShdsF1v/XdMBuKFYMtV3Wfi+mfdjIBcPvCfWQXNTDjyTVVJxx/pYTgE
         k0IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id dd8-20020a056102568800b0047c4e11b4f3si819135vsb.388.2024.04.30.07.01.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-DHvPKsAPNMO0tFnNjxLYLg-1; Tue,
 30 Apr 2024 10:01:45 -0400
X-MC-Unique: DHvPKsAPNMO0tFnNjxLYLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B72F03C12825
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B3CF8EC681; Tue, 30 Apr 2024 14:01:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C7DC51BF;
	Tue, 30 Apr 2024 14:01:41 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Steve French <sfrench@samba.org>,
	devel@lists.orangefs.org
Subject: [PATCH v2 10/22] netfs: Remove ->launder_folio() support
Date: Tue, 30 Apr 2024 15:00:41 +0100
Message-ID: <20240430140056.261997-11-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Remove support for ->launder_folio() from netfslib and expect filesystems
to use filemap_invalidate_inode() instead.  netfs_launder_folio() can then
be got rid of.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Steve French <sfrench@samba.org>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-mm@kvack.org
cc: linux-fsdevel@vger.kernel.org
cc: netfs@lists.linux.dev
cc: v9fs@lists.linux.dev
cc: linux-afs@lists.infradead.org
cc: ceph-devel@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: devel@lists.orangefs.org
---
 fs/netfs/buffered_write.c    | 74 ------------------------------------
 fs/netfs/main.c              |  1 -
 include/linux/netfs.h        |  2 -
 include/trace/events/netfs.h |  3 --
 4 files changed, 80 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 57c6eab01261..d8f66ce94575 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1200,77 +1200,3 @@ int netfs_writepages(struct address_space *mapping,
 	return ret;
 }
 EXPORT_SYMBOL(netfs_writepages);
-
-/*
- * Deal with the disposition of a laundered folio.
- */
-static void netfs_cleanup_launder_folio(struct netfs_io_request *wreq)
-{
-	if (wreq->error) {
-		pr_notice("R=%08x Laundering error %d\n", wreq->debug_id, wreq->error);
-		mapping_set_error(wreq->mapping, wreq->error);
-	}
-}
-
-/**
- * netfs_launder_folio - Clean up a dirty folio that's being invalidated
- * @folio: The folio to clean
- *
- * This is called to write back a folio that's being invalidated when an inode
- * is getting torn down.  Ideally, writepages would be used instead.
- */
-int netfs_launder_folio(struct folio *folio)
-{
-	struct netfs_io_request *wreq;
-	struct address_space *mapping = folio->mapping;
-	struct netfs_folio *finfo = netfs_folio_info(folio);
-	struct netfs_group *group = netfs_folio_group(folio);
-	struct bio_vec bvec;
-	unsigned long long i_size = i_size_read(mapping->host);
-	unsigned long long start = folio_pos(folio);
-	size_t offset = 0, len;
-	int ret = 0;
-
-	if (finfo) {
-		offset = finfo->dirty_offset;
-		start += offset;
-		len = finfo->dirty_len;
-	} else {
-		len = folio_size(folio);
-	}
-	len = min_t(unsigned long long, len, i_size - start);
-
-	wreq = netfs_alloc_request(mapping, NULL, start, len, NETFS_LAUNDER_WRITE);
-	if (IS_ERR(wreq)) {
-		ret = PTR_ERR(wreq);
-		goto out;
-	}
-
-	if (!folio_clear_dirty_for_io(folio))
-		goto out_put;
-
-	trace_netfs_folio(folio, netfs_folio_trace_launder);
-
-	_debug("launder %llx-%llx", start, start + len - 1);
-
-	/* Speculatively write to the cache.  We have to fix this up later if
-	 * the store fails.
-	 */
-	wreq->cleanup = netfs_cleanup_launder_folio;
-
-	bvec_set_folio(&bvec, folio, len, offset);
-	iov_iter_bvec(&wreq->iter, ITER_SOURCE, &bvec, 1, len);
-	if (group != NETFS_FOLIO_COPY_TO_CACHE)
-		__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
-	ret = netfs_begin_write(wreq, true, netfs_write_trace_launder);
-
-out_put:
-	folio_detach_private(folio);
-	netfs_put_group(group);
-	kfree(finfo);
-	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
-out:
-	_leave(" = %d", ret);
-	return ret;
-}
-EXPORT_SYMBOL(netfs_launder_folio);
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index c5a73c9ed126..844efbb2e7a2 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -34,7 +34,6 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_COPY_TO_CACHE]		= "CC",
 	[NETFS_WRITEBACK]		= "WB",
 	[NETFS_WRITETHROUGH]		= "WT",
-	[NETFS_LAUNDER_WRITE]		= "LW",
 	[NETFS_UNBUFFERED_WRITE]	= "UW",
 	[NETFS_DIO_READ]		= "DR",
 	[NETFS_DIO_WRITE]		= "DW",
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index ddafc6ebff42..3af589dabd7f 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -172,7 +172,6 @@ enum netfs_io_origin {
 	NETFS_COPY_TO_CACHE,		/* This write is to copy a read to the cache */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
 	NETFS_WRITETHROUGH,		/* This write was made by netfs_perform_write() */
-	NETFS_LAUNDER_WRITE,		/* This is triggered by ->launder_folio() */
 	NETFS_UNBUFFERED_WRITE,		/* This is an unbuffered write */
 	NETFS_DIO_READ,			/* This is a direct I/O read */
 	NETFS_DIO_WRITE,		/* This is a direct I/O write */
@@ -352,7 +351,6 @@ int netfs_unpin_writeback(struct inode *inode, struct writeback_control *wbc);
 void netfs_clear_inode_writeback(struct inode *inode, const void *aux);
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp);
-int netfs_launder_folio(struct folio *folio);
 
 /* VMA operations API. */
 vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index e03fafb0c1e3..30769103638f 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -26,7 +26,6 @@
 #define netfs_write_traces					\
 	EM(netfs_write_trace_copy_to_cache,	"COPY2CACH")	\
 	EM(netfs_write_trace_dio_write,		"DIO-WRITE")	\
-	EM(netfs_write_trace_launder,		"LAUNDER  ")	\
 	EM(netfs_write_trace_unbuffered_write,	"UNB-WRITE")	\
 	EM(netfs_write_trace_writeback,		"WRITEBACK")	\
 	E_(netfs_write_trace_writethrough,	"WRITETHRU")
@@ -38,7 +37,6 @@
 	EM(NETFS_COPY_TO_CACHE,			"CC")		\
 	EM(NETFS_WRITEBACK,			"WB")		\
 	EM(NETFS_WRITETHROUGH,			"WT")		\
-	EM(NETFS_LAUNDER_WRITE,			"LW")		\
 	EM(NETFS_UNBUFFERED_WRITE,		"UW")		\
 	EM(NETFS_DIO_READ,			"DR")		\
 	E_(NETFS_DIO_WRITE,			"DW")
@@ -135,7 +133,6 @@
 	EM(netfs_folio_trace_end_copy,		"end-copy")	\
 	EM(netfs_folio_trace_filled_gaps,	"filled-gaps")	\
 	EM(netfs_folio_trace_kill,		"kill")		\
-	EM(netfs_folio_trace_launder,		"launder")	\
 	EM(netfs_folio_trace_mkwrite,		"mkwrite")	\
 	EM(netfs_folio_trace_mkwrite_plus,	"mkwrite+")	\
 	EM(netfs_folio_trace_read_gaps,		"read-gaps")	\

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

