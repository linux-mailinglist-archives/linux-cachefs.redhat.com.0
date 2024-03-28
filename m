Return-Path: <linux-cachefs+bncBDLIXLMFVAERBPNZS2YAMGQEFQ4SENI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id D099D890576
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:37:18 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5a4f68dcb36sf1015752eaf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:37:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643837; cv=pass;
        d=google.com; s=arc-20160816;
        b=FWbg9plLFSZeDf4Zrfb5WXyLVN3aJ0lo9byImPmUw+TIXIpULwTPC5SiFq08wfxea3
         mgm8FRD+4t9fH07Q7t2NdHGMGhIMpKsLckpBaCKtYX5SeD3zCcqMBUokE4WsFH10ctZX
         3snFw1IUzYn7P30Zb/XBxpny1CsizbVv4X8E5dv/Xs+2ykTWDknw1syLETU/pfG6RXK1
         tfdgZh67yYwaOTlO0Yn/yAc/UTXbYAELwm9BDjF2SPCc9LigTJzJetQvlDmehEJFhTWY
         DUwyNgMFx4OqL66uBz7XT6GTOmfF3xFBUuvImUQ1/+aRzgnQ4UYtt3hGkRV5mDfCwC3D
         +9zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jhcxxyJUqlzSF9wJWjcQM6SMd6lvj/wm6HKhXcVvX28=;
        fh=ApF74KfZqrjJ1LKcutR0z2x3Vd+PeFAkUeAyZ6VPgpQ=;
        b=ALX2sj2lq3YwOQL7S2LGI1/WHe9aCTFbYyCMGPAtMUNb8Acnk7qCfcCjM3oEPSkX2m
         r/7Qz7hiv84rlvpa71vn562H+IrOmWafyHBxPFKrJqK/yp1fk1f9S6lpmt1T0P/F+S8O
         UCPdhgkolPqwwahGwCsZfX+yV3KvxaQBZFmcLBmE9ypWdhG1Lg0s5b6mG7upByvC8mj8
         akVyg+NpHO8RK004ihsjpVR3njKeAu5i1BXfJ+8SuBSCTwIkwqsiGiWkOnGgMNMTY58w
         bbHMhi0TqBlqBv0nTjnJtRYhTltvI0sDF/azgrWfwjabjqKaSCzFQ7AHb9OoLPiw+l30
         GUvQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643837; x=1712248637;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhcxxyJUqlzSF9wJWjcQM6SMd6lvj/wm6HKhXcVvX28=;
        b=mVGfB0IlZm/wAuIDmCWt5k955wVfS0xN3DAEF9z0QirUwG/G2PuoyJrP7TKVUWHmyy
         dAiAWT3yQ8fDnEhxXZn4hqRqaJVwRhNiUwPzKiz8S1R0uRidFDTpi/M3LL6vYYweff7L
         6zENoZI40xvdQopqK2Q6AOukpkGAN7btwW9cTX80L3vBmWWfwcFyy8UoSPG7yBfNszv/
         wTzJ/KQPY8wZecmfcWtQD3XjuVW55pgcWrajLNWhPxEKMotMn2Np6xqxiu82xz4+djBN
         S5iB8tEs/Q5z5fAPbiRhVNwBqQaHIA0GcYtlyqYE32b0hsexBzAz5nVVxmoPobjsMwjD
         uuag==
X-Forwarded-Encrypted: i=2; AJvYcCXk1NHldrTG4PMRdAXysMj6KHqAtUKdeLNbCIyVGNX4gBFIZ6b7n+swK0LqaVv0WNkRIrSq5nkKNLE4tzY9F7cGN6MkajfCpKisUh4=
X-Gm-Message-State: AOJu0YyBPjglTQqNwBQffCO1b7sd1Jlqb4yQfCGr5mhkf6LtbjDPJn1A
	Jdo3ipN7EvuG6u1iEbCxLSSwf0p5X9xQUcPX5UeIVs5ZVcNTCcZqCq5+DmQvJQE=
X-Google-Smtp-Source: AGHT+IGrQCFpYLu7os+dElm4AYvGzshzFn4Wh/CH9NJGyT9JLnc/N8Sc9J3sbtDc03MuHzsW2f8Rjw==
X-Received: by 2002:a05:6820:189a:b0:5a5:2714:7e02 with SMTP id bm26-20020a056820189a00b005a527147e02mr3540381oob.7.1711643837488;
        Thu, 28 Mar 2024 09:37:17 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:4303:0:b0:5a1:11a7:5d2c with SMTP id k3-20020a4a4303000000b005a111a75d2cls988300ooj.0.-pod-prod-02-us;
 Thu, 28 Mar 2024 09:37:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8/zxjTn2UXU15axEWoIPyeCBb4TgYP8bn8WRUZVIimi8H6DNwszxNxg6qFJdAx2po50GT+DkfLO8GQ+zK0z4bXkLGPc6J3jutR8vHs4E=
X-Received: by 2002:a05:6808:3c9:b0:3c3:d0f6:7972 with SMTP id o9-20020a05680803c900b003c3d0f67972mr2879131oie.35.1711643836731;
        Thu, 28 Mar 2024 09:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643836; cv=none;
        d=google.com; s=arc-20160816;
        b=RlJjBp+B1hoiy3nSj4P/t5+7Ky7Z2X/4ZmsVbsRTcE9gCv7nlqx4LnU/V62g8LeQ7W
         tpIHcQznsKUcQwkzwx4o4j7BOKaLCfbG9OmzlVXpWC3O3vxKVKw9mVVQ5H5TH2wwfjlW
         mPMSn4808hW38MC8X9GzSu1Opbk7KjKOeAikaVI3ZrweQIFYCpZJB92PIUa2A5WzP9YY
         3PX7uKUJKduaJ1zxCMNrzocb2r/DYl7XGuPek99dfA/Ca21EywmcEMJ6BvJ3Kaz1I+4V
         jDgEHsoSZXgkpMBpmsSIPRjpydCz3lht1DrpZKn0jFO4HTYTUyIFRXyjmx92AJXe3C0x
         mc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Mem7lNP+7V6c2t0lUM5oHWZtR8iLqSZVCInVABGeIfQ=;
        fh=3XhF/YurkuF37sFWXE1uIAu37ZbY1OMi9XJf1oPTKLg=;
        b=kd6AZ1gIckmNdX8rsYue3qFVgXhxvkBBtlZEBFDT4rVpVYa1Rw++0ahaUUuMLg5+d7
         eilnQgg3BmhtlsGDJqhO0hE9Rc2Nfc2hHE99v2rnONvs1UFjxUb0ddCoIoxwgI0kOti8
         dq8WAJ7RV1srwgJcIrxWjrdeldsYuHimkS3+uPQF/5id9oMK/rY2+zzsNYc26DSvR3nz
         1sNrgWUYsGUcZwlPJOcZafOdAtkvfolLhAXLDlstfI79l9GEcJjqxSu7+IMHRQVnMykk
         ylR3lZKVTrgbvbOQ8cmjVdSWOrIvQy7ZC9XlveRJmjORntJDQuMU/t+eun++oaHZiJfK
         N7Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 19-20020ac85953000000b00430df37ffa5si1788440qtz.279.2024.03.28.09.37.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-Ulo24OCjNJ-K6Cf1AwXVoQ-1; Thu,
 28 Mar 2024 12:37:15 -0400
X-MC-Unique: Ulo24OCjNJ-K6Cf1AwXVoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF7CE1C008AD
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:37:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CC0CE200AFA5; Thu, 28 Mar 2024 16:37:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F62F200AFFC;
	Thu, 28 Mar 2024 16:37:11 +0000 (UTC)
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
Subject: [PATCH 13/26] netfs: Remove ->launder_folio() support
Date: Thu, 28 Mar 2024 16:34:05 +0000
Message-ID: <20240328163424.2781320-14-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
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

Remove support for ->launder_folio() from netfslib and expect filesystems
to use filemap_invalidate_inode() instead.  netfs_launder_folio() can then
be got rid of.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
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
index 576a68b7887e..624d8859c2fa 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1199,77 +1199,3 @@ int netfs_writepages(struct address_space *mapping,
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

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

