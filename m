Return-Path: <linux-cachefs+bncBDLIXLMFVAERBVPPZCVQMGQEKVAXJEQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E391809367
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:34 +0100 (CET)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6d9aafe6575sf1840485a34.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984213; cv=pass;
        d=google.com; s=arc-20160816;
        b=jNQJdAibtub7NO+ZTyLPZEcXKnisr9QPx8XbauqJTgb0JKDitCQ0k+HFOiL3cVhie/
         kR8O0DzzBGPbwHaiXWuxGflHD9Ay+Aa4Jzo0q4zkC3hVWhrVxPSKeL3zdMbKqCw35i/B
         KmZEi3MJohmi3bdP22AMOBuQFfyqTlKWL0anviktxpHLMXi9FAUVxs4d+/B15yaEkke6
         NJ4ALK/6Uwgs5XJawg3nWUE/oGXHzRebm2uv1hnC6st6Gi1TfzM+yJdS1kYoZPGmwPeb
         1Q+VRDIvDzqPRSHILNC87YA+7+4aHYYX5zWfDNYVggu3aWlee0sFDxDon8Z5u/8MC3/X
         H0DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9ldS/rP071PBWMsTnyyaVNPhk0pysfAGTtWiRnFeEbU=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=t6ZsjniRXNWe3azRaKsJAzFxncPDd4rF+ETux6+wQLyCrUrdiqO6uavvij3Sdg8EFd
         hxgLoASZU+9/fdFI2AQY06SkqpAgEgyZ7hI0YaXyzz7OaxrCGCTObpiAvwGFDcSPAeRM
         Uh1vYpwYYqoQBD75BQxv7zWCxMqjxDrTnm0fGuE2UNKWb1IT/4Zo7hPcqGgWx3O7KNx4
         SkpPp1rAiqiuaqhZDJrlS00llOdRlCK4+73Jh/bmOoPvzpaLaQCG5cXj/D+r/6O8PZi/
         9+7gYX/uyy11vx1Wa0n7oWGd4dkSU8VxOauBM/z2z9HZCoKU2odfphW9Vb5yVmxbqgfC
         h51w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984213; x=1702589013;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ldS/rP071PBWMsTnyyaVNPhk0pysfAGTtWiRnFeEbU=;
        b=FELmr6KCpu5umh9/uaELAOFvH5rLSSf45S7Kw1wYIy0viFQuLouPbxP4jKTEigWZ/E
         g1J/4jZS0Ub7OARrig9KaLjkaP8NXuo6P3X8DBZhxlhws85gQETVjer1stFiphVViUEY
         DdS1PpDA1sXBRB+QEtCDMl/lAXPUYEBWKKCngEdSfGI44pT/wxKP3Y9L2sv5vxeJE3rK
         bSb8R1kkccE/MRJXVlK5iLhGSpSDzJoRlo38yhV8Y0fpQECF0zN6kAwJXut2QHHBCmT5
         5Xhf6VAjVg+72EpJVa1g2VLw/elyBh6xU+hkci5sx3jDy3iy6rW2eYVAJpqySzVZJc92
         MF6Q==
X-Gm-Message-State: AOJu0Yy6wjfYc3xkmaw4H3LEb93prYhLptfIU8c/pQD1dWTHaFUxYGu4
	Oo/uV5Hwf5XM/ZuzwSnXSa9PmQ==
X-Google-Smtp-Source: AGHT+IF8f4a9+CODx6j6m3Q8vTzLfvq07ir4PSedDMPSuZZd560kVMtV/igygz78phsB33gmZ0KlRA==
X-Received: by 2002:a9d:7cc8:0:b0:6d9:9bbf:a40d with SMTP id r8-20020a9d7cc8000000b006d99bbfa40dmr3386222otn.55.1701984213178;
        Thu, 07 Dec 2023 13:23:33 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7c44:0:b0:425:8441:6aeb with SMTP id o4-20020ac87c44000000b0042584416aebls1483514qtv.1.-pod-prod-03-us;
 Thu, 07 Dec 2023 13:23:32 -0800 (PST)
X-Received: by 2002:ad4:5f08:0:b0:67a:a721:9ebe with SMTP id fo8-20020ad45f08000000b0067aa7219ebemr4114584qvb.111.1701984212662;
        Thu, 07 Dec 2023 13:23:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984212; cv=none;
        d=google.com; s=arc-20160816;
        b=oiWJpplFls/ccLSZ1jV+vdEe/dVqspeVhJIFazlziIg/ASfcl1+gfN1P7i9TirlA0T
         DU5oz+gMaj7PoyC2LAsgJ/k/wQ5Z5kaaIB0F/PU4yEQBX+/GFYfYd8bzmWNk6d1PcRq6
         QzyFxKP8fOXhApChj/jhr6bMaTnzIiaAMQFwkkokhgA2qRtMy6tSX0PwzI9YyEvviGNC
         6lndoaHnvxQ3rKkDAzYUJO0XJG+SpagU3yv4KDB6jXsFv3UXcFYxkMU7Mll3jtvi9rtN
         r2RfHCjtWsB+GjlUmRofwaGncaZJx4iUuYNolQ0nOvJtvNwwltj3sQrhCYQXTj/eXB+F
         AVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Phrx3fGDZKeQLzNhuAfZArkoH94a0wr5I8zZ03h7/KI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=MsFq+xIrdcFOZ3zDezEGDPO+QbFj0WmFb3YWscXseMhjNkL5n2gNmGTeCfnXPN9zSj
         Y+vnKQngLKXHMR/xfzv3zf/VFTDdKUx1QV4vJIUCSPWT7ZichxZkm6+4IxXdV0T96MC6
         7CIZQMYYkYrA/CZqRIXayMfNcO6C6FttBMBKqdBynmXbmGJjBAr6ZK9WwkvDqSR/uHtz
         Pliei1xkLpQEGp2nBQ5O/Bxz3QViiKUF2cRdHq2u8v/HXG/nRv0XsumrC/nWR277jYEi
         wctndASj5fYXNg7xxlwX5dgzDyrL+cSy66+Xy+2Ic3z9EKb4xED3Eehby0FxM6c3+S4i
         e5sA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id i10-20020ad4410a000000b0067a94dbd7d3si629401qvp.6.2023.12.07.13.23.32
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:32 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-RjZlB9vjPlKuhcXGz-yMUg-1; Thu, 07 Dec 2023 16:23:31 -0500
X-MC-Unique: RjZlB9vjPlKuhcXGz-yMUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1BD010B934C
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EE748111E402; Thu,  7 Dec 2023 21:23:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D9DA112131D;
	Thu,  7 Dec 2023 21:23:28 +0000 (UTC)
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
Subject: [PATCH v3 23/59] netfs: Prep to use folio->private for write grouping and streaming write
Date: Thu,  7 Dec 2023 21:21:30 +0000
Message-ID: <20231207212206.1379128-24-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Prepare to use folio->private to hold information write grouping and
streaming write.  These are implemented in the same commit as they both
make use of folio->private and will be both checked at the same time in
several places.

"Write grouping" involves ordering the writeback of groups of writes, such
as is needed for ceph snaps.  A group is represented by a
filesystem-supplied object which must contain a netfs_group struct.  This
contains just a refcount and a pointer to a destructor.

"Streaming write" is the storage of data in folios that are marked dirty,
but not uptodate, to avoid unnecessary reads of data.  This is represented
by a netfs_folio struct.  This contains the offset and length of the
modified region plus the otherwise displaced write grouping pointer.

The way folio->private is multiplexed is:

 (1) If private is NULL then neither is in operation on a dirty folio.

 (2) If private is set, with bit 0 clear, then this points to a group.

 (3) If private is set, with bit 0 set, then this points to a netfs_folio
     struct (with bit 0 AND'ed out).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h   | 28 ++++++++++++++++++++++++++
 fs/netfs/misc.c       | 46 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h | 41 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 2f5a83f4b13a..2b0c087c6fc3 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -149,6 +149,34 @@ static inline bool netfs_is_cache_enabled(struct netfs_inode *ctx)
 #endif
 }
 
+/*
+ * Get a ref on a netfs group attached to a dirty page (e.g. a ceph snap).
+ */
+static inline struct netfs_group *netfs_get_group(struct netfs_group *netfs_group)
+{
+	if (netfs_group)
+		refcount_inc(&netfs_group->ref);
+	return netfs_group;
+}
+
+/*
+ * Dispose of a netfs group attached to a dirty page (e.g. a ceph snap).
+ */
+static inline void netfs_put_group(struct netfs_group *netfs_group)
+{
+	if (netfs_group && refcount_dec_and_test(&netfs_group->ref))
+		netfs_group->free(netfs_group);
+}
+
+/*
+ * Dispose of a netfs group attached to a dirty page (e.g. a ceph snap).
+ */
+static inline void netfs_put_group_many(struct netfs_group *netfs_group, int nr)
+{
+	if (netfs_group && refcount_sub_and_test(nr, &netfs_group->ref))
+		netfs_group->free(netfs_group);
+}
+
 /*
  * fscache-cache.c
  */
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index 96014c3d1683..40421ced4cd3 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -177,9 +177,55 @@ EXPORT_SYMBOL(netfs_clear_inode_writeback);
  */
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 {
+	struct netfs_folio *finfo = NULL;
+	size_t flen = folio_size(folio);
+
 	_enter("{%lx},%zx,%zx", folio_index(folio), offset, length);
 
 	folio_wait_fscache(folio);
+
+	if (!folio_test_private(folio))
+		return;
+
+	finfo = netfs_folio_info(folio);
+
+	if (offset == 0 && length >= flen)
+		goto erase_completely;
+
+	if (finfo) {
+		/* We have a partially uptodate page from a streaming write. */
+		unsigned int fstart = finfo->dirty_offset;
+		unsigned int fend = fstart + finfo->dirty_len;
+		unsigned int end = offset + length;
+
+		if (offset >= fend)
+			return;
+		if (end <= fstart)
+			return;
+		if (offset <= fstart && end >= fend)
+			goto erase_completely;
+		if (offset <= fstart && end > fstart)
+			goto reduce_len;
+		if (offset > fstart && end >= fend)
+			goto move_start;
+		/* A partial write was split.  The caller has already zeroed
+		 * it, so just absorb the hole.
+		 */
+	}
+	return;
+
+erase_completely:
+	netfs_put_group(netfs_folio_group(folio));
+	folio_detach_private(folio);
+	folio_clear_uptodate(folio);
+	kfree(finfo);
+	return;
+reduce_len:
+	finfo->dirty_len = offset + length - finfo->dirty_offset;
+	return;
+move_start:
+	finfo->dirty_len -= offset - finfo->dirty_offset;
+	finfo->dirty_offset = offset;
 }
 EXPORT_SYMBOL(netfs_invalidate_folio);
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index a14af93efccf..2406e11b41bd 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -140,6 +140,47 @@ struct netfs_inode {
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 };
 
+/*
+ * A netfs group - for instance a ceph snap.  This is marked on dirty pages and
+ * pages marked with a group must be flushed before they can be written under
+ * the domain of another group.
+ */
+struct netfs_group {
+	refcount_t		ref;
+	void (*free)(struct netfs_group *netfs_group);
+};
+
+/*
+ * Information about a dirty page (attached only if necessary).
+ * folio->private
+ */
+struct netfs_folio {
+	struct netfs_group	*netfs_group;	/* Filesystem's grouping marker (or NULL). */
+	unsigned int		dirty_offset;	/* Write-streaming dirty data offset */
+	unsigned int		dirty_len;	/* Write-streaming dirty data length */
+};
+#define NETFS_FOLIO_INFO	0x1UL	/* OR'd with folio->private. */
+
+static inline struct netfs_folio *netfs_folio_info(struct folio *folio)
+{
+	void *priv = folio_get_private(folio);
+
+	if ((unsigned long)priv & NETFS_FOLIO_INFO)
+		return (struct netfs_folio *)((unsigned long)priv & ~NETFS_FOLIO_INFO);
+	return NULL;
+}
+
+static inline struct netfs_group *netfs_folio_group(struct folio *folio)
+{
+	struct netfs_folio *finfo;
+	void *priv = folio_get_private(folio);
+
+	finfo = netfs_folio_info(folio);
+	if (finfo)
+		return finfo->netfs_group;
+	return priv;
+}
+
 /*
  * Resources required to do operations on a cache.
  */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

