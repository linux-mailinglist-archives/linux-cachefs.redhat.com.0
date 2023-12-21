Return-Path: <linux-cachefs+bncBDLIXLMFVAERBUPZSCWAMGQE6P6JNIA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE8281B76D
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:38 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67ab7e9d393sf10433696d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165137; cv=pass;
        d=google.com; s=arc-20160816;
        b=OMPIJDHVFAVtLgq/Koe2gsV/Gu33ytJVCTLB2fAVjeP2b6ItFBdmVEbwaRpPFA5Mew
         J6CBjbN4L0T/dDyy4LjZxKxNWE7TdO0qRd18tLoWPjBzGEIXzN2A2ujwGGJNacyam1U8
         j/SzeJ9E9F+EqcFurRQ8UYxXlpUeXh3QHl5J0JRVTPAO1xeqY2Vm8Yicvr3rulnH5SNU
         AKcevZ8egIbd33Q7q8pFhHFZiaG/iYH91LjgTKTuut0+cQT6uPmp3VXmZQ0pGxSSkRke
         lxr/NbsqoCpI5xpsrzUJyxIgRB+obRw00GwxXOFBI71Osjucy36ylNcTpEpzh/qG/4KH
         SXkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=C+OLyNiZhmj7fibrjlYcKUcmRV7ccAIwYwGLVNeXSfE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=hb+UzGjBgDrBCHPC0RNykf0SSpwLwIkiDateXvN040U66eevrBy6ar2zG9wnPUDKhl
         W6YMT9RaVU2wyz8fXSj/AQzpk3caBUe6HFI6Iy2Ikb0F521ToVwjsI7FC9L4a3yhfP/J
         VKZdObkn4S6yjANCPzkpTDNmm0F+h6/AGibAJ7sBZuluvgwW7rW/LY3U0bhk9JFNJMLC
         Qtsn7gtzL8FnJEgOrq+YkB39ZegOfndByz7/4kzD9KeCYLg1Ogwm/CRbcmpDw2S5heI9
         IV4U526/qUPJKiPHrME8ki5nAlWWLqZBEuHL/xe3ow8xC+HWGMziVeLsmdUYeG8bV85G
         BRWg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165137; x=1703769937;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+OLyNiZhmj7fibrjlYcKUcmRV7ccAIwYwGLVNeXSfE=;
        b=PjG6xXtWiJZvupFCrA1EDM24RObUJacJYhLNKC+/nnybGip5Zq55fX/sbJhJpzQnRg
         qVd/O1jcrrhFT/kW8WElsxTGu3fGZdodbqr9szZL4Jc3Fxq1ii21Kw9dDxMGnJbzln7y
         cjqI81P4l15LKJLyJMoqK3zacAkpfjkbCtud2LTiMTSUbOZcRyLFKsynMFlE049vjw1v
         wwRuIWiLGFLQ63ZrgKKHNs8di1NGMWmk1s4iKhPEVlXzjGJpqAw2dDJ/uP5Pp+5UgoYg
         EEYWve3TYouCiyenRDd1kcX2mcqKbyzTCZbr7x6D5ixz/Chxj4gdPIWh3C7kE3OaPiOE
         ldVQ==
X-Gm-Message-State: AOJu0YxGaIyR17E2C465ol3LKp2Viv9ynix4esAAUallgSs2BrVVfrCy
	ybJ/40G59OgT3Lp/n66wL2Xn2g==
X-Google-Smtp-Source: AGHT+IFDG3qJWHXd+oKbeCfTOKnvx2zhfCHySmpYEW1TBBCX1P1fXswB9YN77VkoCBeU4Yxvb+AXow==
X-Received: by 2002:a05:6214:234c:b0:67f:383e:a33 with SMTP id hu12-20020a056214234c00b0067f383e0a33mr11369920qvb.131.1703165137667;
        Thu, 21 Dec 2023 05:25:37 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c6e:0:b0:67f:476:d152 with SMTP id i14-20020ad45c6e000000b0067f0476d152ls1790991qvh.0.-pod-prod-04-us;
 Thu, 21 Dec 2023 05:25:35 -0800 (PST)
X-Received: by 2002:a05:6214:c83:b0:67f:cca:edd6 with SMTP id r3-20020a0562140c8300b0067f0ccaedd6mr17936815qvr.125.1703165135675;
        Thu, 21 Dec 2023 05:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165135; cv=none;
        d=google.com; s=arc-20160816;
        b=iMGIweJYDGPlKbmuttzNAYUTM+JmQsh93QMYdGwSwpu9Mm+At53KwQ1NpV4zSBCtHu
         Kjbmoy8I0mOcr3eug9Tv9LWVR8id6XWKZ9Q4rksESKKfkWtr22VwhcUynKK5HY/qtvix
         Ome7EofFo32fNe4mKe7B2prrh8Qzcn22JfalvoGkr83WuQAJ0/t0/n7emHa+KMsvBlqW
         tXsKdmqOvXwj53LFDpbKKftfC6toJmhpAbqzhZl985Na7dtW5kFbZjG6lVFJKpIujk5O
         kv+RvCoqBY8K/H2cBhLJYzHqFZmW5tZPbhceRGfA/s8zRXP/TidzvamadWqi/hsAwQtU
         Ea2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=yOUF/NRG7mUfYTB4RMtCJtSjpr7YJjQloMElL0RkM4I=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=08pjueAjbuMv/tIYXdmotHfkOQ7wKRe9tHx3PCdhdJATsemm9t0vQ+0Qs5HDoo6kfx
         Jm6Tl899VTn1hVObfvS1+1IkB0RJncGNzm7rIsYoJULyElftao13x3/OMryrqccGmZAp
         r9Lp8hAS9l3tU1cBY8BPO/f8ZSnRvQ6zFir1KY97Ay7lDffCJLDeyDLMjoldr9dff0Kk
         R+jNBiInPl5TigSSetWKxuG/cOy7ok1J5fQB7O+RvhUjPge5J1XrBiRx+OT8ZDO9Oa23
         lfajGFM1TqZRmcn8rDTYPJFdfO5TY6SXqNC85l5OAGt10Se6ie/d/mUC9e6SvriqX6Op
         AfKA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 19-20020ac85913000000b0042790d0c9edsi1978060qty.425.2023.12.21.05.25.35
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:35 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-6d5h6mgaNkeMwZNy416eWQ-1; Thu, 21 Dec 2023 08:25:34 -0500
X-MC-Unique: 6d5h6mgaNkeMwZNy416eWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB24185A58A
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B7A90C15E6A; Thu, 21 Dec 2023 13:25:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE310C15968;
	Thu, 21 Dec 2023 13:25:30 +0000 (UTC)
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
Subject: [PATCH v5 23/40] netfs: Prep to use folio->private for write grouping and streaming write
Date: Thu, 21 Dec 2023 13:23:18 +0000
Message-ID: <20231221132400.1601991-24-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h   | 28 ++++++++++++++++++++++++++
 fs/netfs/misc.c       | 46 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h | 41 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 2bf2e82b2ad7..d72292e40f9b 100644
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
index 5d545073fe03..eeb44abe59c5 100644
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
index f87193fa0f16..bb78021332f5 100644
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

