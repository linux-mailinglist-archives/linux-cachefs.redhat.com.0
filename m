Return-Path: <linux-cachefs+bncBDLIXLMFVAERBTNQ36VAMGQEGGUWADI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83C7EF98E
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:02 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58a2803007asf2477434eaf.3
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255821; cv=pass;
        d=google.com; s=arc-20160816;
        b=MOczQ0iZQUSZv46mT2Xnp2XqdsRQ9jjZRSn7tVMAZLOg5Co36/FQ0R1HPr3/zG6pvr
         HaPpgoZ9/PToVtDvz9RBBLt6p8vtGte8ugX9//IDRSnmn8HuulkrCennf7xYOm0k1X7u
         oYCxgW5MAg4MDF9nASolz2vjjL3mTr/rn7EyrKqb7t2X7Uqqaai8kKTl9hlTgo309CwW
         YD1kRxJLymazhCyheR3IKkWvFXH31+7vtzGnGvvAg+U1aGeMgo1gZ8g2R6cPzh67uJWB
         5ezma2H8PwtGpUreMsrojPLag39FSiBQv3+LFgPgVb7ktlJXf4Cow0CQubsjlmBnG8gx
         YEcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=atWucGMKpKftD1ykct1YzQw7kE6b59yq660R6CT+41w=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=DaG7Iu7sCk2lH5+yFFhDauK2+udQKnwtwALiULRSmPt2qrb2bY3dP+AD9glK3dhN3v
         XZxwrLFtGXHFbltPT1C/8luMFf+U5NbVAYWrrf84Q0svtrp7CNrsODyl77oejZORDnVj
         NbOXbfKNAqidetaQlLUihh5pegFaTqhLikf580tuOxs+LKgnIIFb9346C1U2kMUXwq7I
         1Sz1ibuzjdeiCyX4RZXW8mys2q0GZsUvte1A8tMgHwQkp6S6qscfLIlCs3snFKEx7Jcj
         86JtVRIUFsFL+dIj0VGPS6GAD7PAa1VhJGj3k8JodtcN72T3PKHYO9kaE9583iE6lYxd
         f1ZQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255821; x=1700860621;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atWucGMKpKftD1ykct1YzQw7kE6b59yq660R6CT+41w=;
        b=QF863/dBtS9jrlVUf2BhzKzffJcZF0SujwFkbDuKEZZILA5huGISVpmvl9eDC9iROE
         ybzy3ISk7hF14VgqTwGKmF9GPgy+zfe1AmQTNWE0tHX5Jf9Odro2DB36HY8mgzn+vwRN
         hgvEfO2Qm0j1A67IkO1u430pt4OeEhv/3ZmubHKXIhbZiCvpRpybrs3HmJt+nT8rrT6O
         oCYLequnNNCYubgQKRrKapWACVD5q1S43k3QPnByKBVIvKbNdPdk2RUDeTrV0T9zjiDm
         Hse85tQdVQMTx5Sm8DCJF/YKW6lJzZBCYrTNdvDKn4uLDFvDpKzzPAAD5sNUflbXns12
         61Wg==
X-Gm-Message-State: AOJu0YxY7rRlIL6KEQXrEZ7IdQAU1TP7SKX7HaFtkmhxnswhipZLLEJK
	O8mWcllyRHfLWSLxYMkBINe/SA==
X-Google-Smtp-Source: AGHT+IGoezy3RggasVfpBlLdyEYSHTVs/quQgkT5IBATBru5JaTE76762t06yaBJC2d0RT4OIR8yoQ==
X-Received: by 2002:a05:6358:c9f:b0:16d:bb6d:c71e with SMTP id o31-20020a0563580c9f00b0016dbb6dc71emr438411rwj.8.1700255821357;
        Fri, 17 Nov 2023 13:17:01 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7f4d:0:b0:419:5434:d639 with SMTP id g13-20020ac87f4d000000b004195434d639ls1363660qtk.0.-pod-prod-06-us;
 Fri, 17 Nov 2023 13:17:00 -0800 (PST)
X-Received: by 2002:a05:620a:2b88:b0:77b:b34e:6262 with SMTP id dz8-20020a05620a2b8800b0077bb34e6262mr862575qkb.46.1700255820815;
        Fri, 17 Nov 2023 13:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255820; cv=none;
        d=google.com; s=arc-20160816;
        b=FaVkszoFQ4GdzekPczcV9G5PaUQwH43LeX2Pq2NpFnUrO9sD2f/JowbT5GjUnohCjY
         uUtRgtz93UvWN4/DyOV57uxNJYyW2yJypAdDxdTcSBVAaKf1+dTsOQLdoiaXk1F39EzE
         r/+rYCcyLqfL6hjPsjHjcquys9NOUERXiER8edvGfJZMyZy0+tn0XDGVMDTFeSrG0q4D
         Z0K9l88WfuDDMm726TMOgKg1YHfzaGA18mAIg3izZHQ0Rx8UdkeNLD9dQju/k1W6Fq7i
         LGosJKx58m7vkxqz/uhNlAGJGriisD8knPrcxUtKmryInzCgpdUOKo13xNukc22O5Qmi
         bKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7zlrtVP9gWNmRGnOn7f2uvsEAwv8V6n9Qv48gmz1Paw=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=ueYVPrKd2fUe5uC4zmmF7rkJg3WxHb6+PqXTAoMA+/HKcnd8Ec4KvWWywHW3ukvJuq
         c0+/gRvpsh5LFNT+Fzttc0SH6H+XCAXRkLder+Rvo/4gW632QLmX2ycf1Akob48Uv2kb
         toc143pEubme4QXIMEd5BSFpMiq5Tca6MrOfVKpacFebgIMV0xUbglbxoACagT5A6ozw
         Io1J6t6HgQjRjmxL3O2d+7/t2NyRXYKwMxBoEivpQkZgNfERAR3OqHbxayMmzZSmupWZ
         0HR3Ioq4NFJNhv8KruJFqgVC+HmSux8aQdR/vJCmqzyAGAliwjeaZg2ubz2q2INRosr+
         Jpmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id dl7-20020a05620a1d0700b0077891ebc8d0si2636543qkb.626.2023.11.17.13.17.00
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:00 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-9NtrSk3RNFq4tkjyVL9Y_A-1; Fri,
 17 Nov 2023 16:16:57 -0500
X-MC-Unique: 9NtrSk3RNFq4tkjyVL9Y_A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D901F3C0C11F
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D3C00492BE9; Fri, 17 Nov 2023 21:16:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A2AD492BE0;
	Fri, 17 Nov 2023 21:16:53 +0000 (UTC)
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
Subject: [PATCH v2 20/51] netfs: Prep to use folio->private for write grouping and streaming write
Date: Fri, 17 Nov 2023 21:15:12 +0000
Message-ID: <20231117211544.1740466-21-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
index 3a920377b01f..985647c4648a 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -144,6 +144,34 @@ static inline bool netfs_is_cache_enabled(struct netfs_inode *ctx)
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
 /*****************************************************************************/
 /*
  * debug tracing
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index 106f2fbdccd8..219d04013486 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -100,9 +100,55 @@ void netfs_clear_buffer(struct xarray *buffer)
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
index 21650db7da54..6f4e24da27e2 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -142,6 +142,47 @@ struct netfs_inode {
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

