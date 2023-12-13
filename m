Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4UZ46VQMGQEO72QN4A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB481165F
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:39 +0100 (CET)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-203396d1b0fsf95290fac.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481138; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZuFDUUpgJE2A013ZQ8g8LstviZ0nfJBQGHgFBnA3po1BuUl+YBAhCDDwOPkGTd6JNA
         +2Y/+yC+FXX9St+M2Db+2bk6j8Swhn4PE04RfSgX7YIZ5mKQiJOenc59daHceZz24KsS
         RdASjnT6oANz3rYkNQn/rJcxzaL9j+StoGeeA0hRHIwqsQVAosQcI5ITfV6C2b7tOFZh
         2ZF3cwnNEmjSEIpWKnl/Jx49grbVEMua+tGw67SO+Ijg/jESLx+Dj06aYsUOKIVq2Skr
         3tnacp7W+ur8pPd819RpRHWEurMx0Ri2yHcNRNi5Ua/h5atdDmpY4VdyzGYoK8kqxWMh
         nFYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=yWcqwaMnTUANaTfcct2mqRMnqOlXhef92JZjgH0JpLg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=MumIpsKZbFB5eQQOA/Wd0U8P5IbTrkwbc4hLHVkbPPQHezL9uJ3UNDOcTcpCLTQWBD
         3h8TbFHzj67J/1DslwbIh3rmNuYksHBlcnoZwhDhn3DqlZiVZq8TiIhZWg2L1Di1SNBw
         NzsUGfUU4Q6322z+Iq38nozapfD4VOZfcDt1Rq6yA6YS0XV5qpfiCZwLOq1j3Bw5OGBA
         szfKiZiwEpl3FQbHbR1AUoqXWSakMeDO1PEtvMN2J7jNIeS5X8DPrn2tWMz5XD5NHHb4
         5F5cwAAx/y9fp+wvYJK5fEPZNMz62gmdP3w6HBfBJDiqkX7971/XMZ5Sj7yuZeCP7DFM
         hxRQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481138; x=1703085938;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWcqwaMnTUANaTfcct2mqRMnqOlXhef92JZjgH0JpLg=;
        b=E6xXlJQ9SlLwEYyQsVp6B4fRNIcUihf5ucMM00JvSm/anfdA6SgN8kWRMQzIGPxA51
         JoaQzkdHzkOj15UANzuORkASYsnkyZuU769QGjWI+jZGErtHfkMFkXHd/PpS/4ssWxVU
         Jd5RjFaslWJWSFNiVtaKVRZur57OuhH99Dx2ngG900aTb7NC8o38bFmWK372zzKUhQvL
         /65K/WSdppdmCPjTxLpoNwFUHlpdLmIP9ypqK5Mw09Umbrf+2mxQG17MvVcAtEVL7/G2
         UF46VYps4FsW6VKziPym/1CJUImxjvYccKG6VavvlmdGZFUXdizUx94BMUOEgx8AvOiQ
         kGAw==
X-Gm-Message-State: AOJu0YxGPLgCHabbHSmRNZHQrW6ma6aNRMb58ofTQ5ym+0jXqDFmf+rg
	rv11juYoMfKFCC//BUPbgpxByA==
X-Google-Smtp-Source: AGHT+IGZUpUvXgllxRat5+Awd20nsve8OzC/9gnrFWHhhqeRvd+oGw2cXLnVrCqW67/f2twRahjlqw==
X-Received: by 2002:a05:6870:b28d:b0:1fb:1a86:8db0 with SMTP id c13-20020a056870b28d00b001fb1a868db0mr10414877oao.8.1702481138229;
        Wed, 13 Dec 2023 07:25:38 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:fe90:0:b0:67a:b4d6:5fa0 with SMTP id d16-20020a0cfe90000000b0067ab4d65fa0ls295581qvs.2.-pod-prod-04-us;
 Wed, 13 Dec 2023 07:25:37 -0800 (PST)
X-Received: by 2002:a0c:ef0c:0:b0:67e:f854:a70 with SMTP id t12-20020a0cef0c000000b0067ef8540a70mr1324936qvr.30.1702481137547;
        Wed, 13 Dec 2023 07:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481137; cv=none;
        d=google.com; s=arc-20160816;
        b=nP7KYJZbKW0gCP0xV5/bRH7SQLVriX8EVcFTbhwHY+vSfrbMF++6LfMrfUiL6+uOcM
         tGH+MspzqnYXsVdBB82B4MPrrm0ggOkmx7PemUrBRDpzxOAs05xmv1qRgK3gPmFiPl1i
         jTsIHCgq/l2PjBLQ3OPEmbg5zjnUSVsUDFmdupunkrybwsaw9ouf9V9OrclSKzbz2b8N
         xo1FTOwXTHnaXqQrV+QAYFUarqjcchr39COFn87J+80YdC6woDdCgyCqmZbfdwWBrS6k
         mgTaBPMLkIIlBFq48vhuegSmIPRt5E3If0Nsh/jVPoUIkSJ2+1hMrvjM+EE2zAaSlWuI
         2vsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/P39zA4P9i416f7rYVx3fltLx7nFHwqFVafrmIB+g6A=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=gAq/I5WW/A4XDy85NF5BvlKrm1i/A10zf2c//Bf7nMsNE6IYxYQXyQk8nXtCKwxXCQ
         wJs8LZDcLKGrCj9X/oIRCVZRVLtLQAbW6EPN6DMVwbbMPjQuG55tMELDDEdGz1lFDnnd
         FzfZgNWvhp5xfbshQFeOidKxJQ44vDtILQVQ+TAo1kNL+NstMp6Jol5vFJNsVZv5r4Uo
         6keY3Gi6pJYiVijKQkBALd/SUKJ5jlHNC5DAnwYSxt4oKaLGgDwYlXVGRZPnXL70LSVp
         bHk6CddMCDAygMB4RVyIH6clB7vxbOLx9MoOzyJzncX5yd1NLquexE2ZhALcRuVLsa/H
         iBew==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id e20-20020ad442b4000000b0067ad8f2d4b7si13417193qvr.287.2023.12.13.07.25.37
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:37 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-46-tk2W52mnMcy4qkzH7SfsOA-1; Wed,
 13 Dec 2023 10:25:34 -0500
X-MC-Unique: tk2W52mnMcy4qkzH7SfsOA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 739751C18CDB
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 712F5492BFD; Wed, 13 Dec 2023 15:25:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36718492BE6;
	Wed, 13 Dec 2023 15:25:30 +0000 (UTC)
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
Subject: [PATCH v4 23/39] netfs: Prep to use folio->private for write grouping and streaming write
Date: Wed, 13 Dec 2023 15:23:33 +0000
Message-ID: <20231213152350.431591-24-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
index 8d1bfc9c3e2f..1b83c534593a 100644
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

