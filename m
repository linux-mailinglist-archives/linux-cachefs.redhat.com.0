Return-Path: <linux-cachefs+bncBDLIXLMFVAERBAFR36VAMGQEI53SR6A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FF97EF9B5
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:53 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41bef8f8d94sf26255161cf.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255872; cv=pass;
        d=google.com; s=arc-20160816;
        b=ftyNO/pff+j38rneawz0fGj2XY3rFxyTavxruIoWr4ennmCE3srPa4Oy2gt+Cvbe8Z
         FEPA4ZfED1MVmABjJORsO6YtbIFEWZnbwSMcXTZXYsV6ylaRSVCJ3Lzs6dHa0IyZu+3T
         clkYMYoCtRIEpgHc+aozBACgiF/lOiDGXrD+s8w7ekWbzB7S9KbBZYBIOoSr0QtNOJkY
         bVdKX+kQeeYa96XgfHq0tQhNGCkbXWvqma++z409OJGG5S9Wsh8YLIdlQk/BsR4ELqFz
         Oj3T302t9Jyw/ze83uLa1J5CmQM/04wolS5WPoT9PtHsid2/ruScBCB4DXhlI4axUyuC
         BKnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=WH8E+cF9vq6MFyyxPt5Ix8cUjFhsFHieM0jaHIL+EVw=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=VmODCn95ghmEqJa1IcpWvJcw1/UH0PPJpTtsv71BpJz2OXpaMqOo2u39kjbj90i/U6
         22j920rdtsQavHYe2rJnSNhZv6LqnctvrDSPwK+3jbDWxSUPbtgkQUC9hOGHiPR3MyzK
         GL5ZukD+CqIMQHDj2U9AA6X0Tu3UI+pJa3Xd9WpRE8FRpr5xF2A/QRKItOeXGsnhqAG0
         Pqv7GazeyFiFm78ej+iPvMXBy5rnMsLJzEcrzZS1vnFrj4BShNka027tr0IK02lzTWVn
         lX5keca7AQXjzeEgyFzSp0X6Fvv4ARBp9dJ+ZWTzTd2oZ8eATqBYYczdDT6LbwZzEuxU
         GenA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255872; x=1700860672;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH8E+cF9vq6MFyyxPt5Ix8cUjFhsFHieM0jaHIL+EVw=;
        b=PLkykXpNgUj/vVprEIptRuCn7sjqzKwcCgX+RNEghmhLNVqwT2ib9ERtetQV8Ns1cw
         PY/R56NoT2ARA+SslFQSC2ivZaFOt1AllgX7lpYm3NORrYtScX5vQ/lBL8UIRZ2wroRG
         GB89K4XgdTjJ7+UqGgym9uULeYYzA0tbALyeh79fBOQDQW93lJNk21LXOljoOAJOGT0u
         hkAIlpu3843U5y9/C3cgzyqXsXwwPM+j8mmvAJYHGLtCNemmimy0PgYpTxh7m8L9g+rm
         H23TwZxpkoO4cK3MH9U0Kja4h7MpqmbstGNaQ/C0nPpj9LMrt2p2VPWNYS9rcIYjEYrY
         Ibwg==
X-Gm-Message-State: AOJu0Yzm+mjCoqnrzB4ec3NK84PYeNarg5u74k5HSRk/cfwHTAvOg5fh
	wrTliCWG2y5We4F79AYOkSMT4w==
X-Google-Smtp-Source: AGHT+IGs7XVQTibZr1Tjl+8tDP8APpJogIBSGwKfV5KwuxjA02136o/wL+R3fGweAK/+DhOR8A0AAw==
X-Received: by 2002:a05:622a:5cf:b0:41c:bb79:ad45 with SMTP id d15-20020a05622a05cf00b0041cbb79ad45mr1050179qtb.12.1700255872524;
        Fri, 17 Nov 2023 13:17:52 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5704:0:b0:41e:89db:3bf4 with SMTP id 4-20020ac85704000000b0041e89db3bf4ls2204950qtw.2.-pod-prod-08-us;
 Fri, 17 Nov 2023 13:17:52 -0800 (PST)
X-Received: by 2002:a05:620a:6188:b0:779:d0a6:2e4c with SMTP id or8-20020a05620a618800b00779d0a62e4cmr805481qkn.34.1700255871907;
        Fri, 17 Nov 2023 13:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255871; cv=none;
        d=google.com; s=arc-20160816;
        b=lh7J+HOYT7aNtyjlvqRYQUEK7BaJWkK8bePCOTmNgxCEMi9vPxFl6uq5Tc9ikUsC/y
         nmRx1rYutBT6B/mq9VI08Mjmo4bKLT8jLXaZcdfswuyRxytFZ6jG+VzBxHuMQ+B+E4Zw
         3j8S7mJBEDQ4siX8K8HB0GKddNsasVIzFXIVfnz8WKqNm0PoNNzMqNSFwS0JE/tszJnt
         3TDI7nzAvcB3PkBEQ+GjSe0w/f7RMClk4dE+aiTCqcIu4C5Rpp8Nlwxj7zpVhtrIN8Nu
         S81GrpFiafkP+l4t9NT2Dx8/eO3GtpmYPGPmANjmYmGoHUxI5e+VS4lDe3muHOL566jP
         gqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=8vjTTCvvYvaQCYuD/oiutq3ZhL8gEcV49d8YEYcq98w=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=WI0/6lzzbuLw6qDKW4P6zB65aymPiAkvaS3ZK8oLfuObRqTHfpgmKf5tOp8UJMzJsO
         GJxP9x3EGOHApKiHRFfEev3PUD/5Hh9UQgcPII5F5MMFQea5tMxrsR3VvnGC6HcPaxHE
         ALxYMypfCc/PjsQ9cT+TWerR7W4MNGTOvZ33BJKEbXN1IJL/K0g/TIDKzfrmh/ce+uuV
         X/LQJTUfOii6dIISS4URigBdFebSucfdIwV30ZE1wA3lbDAGmFuTf1g+BpVvh5Wm5JAW
         RfvZng/beqzsQiAjx1d0fDd5ym/DEuvybqC1d01hPKWmDX6k/eJVinvvt5zSr6ErlsUv
         Hgbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id bj7-20020a05620a190700b00774184acfeesi2478779qkb.297.2023.11.17.13.17.51
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-Pw5lvajbMhGjmaKtgodc5g-1; Fri, 17 Nov 2023 16:17:50 -0500
X-MC-Unique: Pw5lvajbMhGjmaKtgodc5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1331881B561
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0FB0B5038; Fri, 17 Nov 2023 21:17:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5302D5036;
	Fri, 17 Nov 2023 21:17:47 +0000 (UTC)
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
Subject: [PATCH v2 30/51] netfs: Provide a writepages implementation
Date: Fri, 17 Nov 2023 21:15:22 +0000
Message-ID: <20231117211544.1740466-31-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Provide an implementation of writepages for network filesystems to delegate
to.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 625 ++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h     |   2 +
 2 files changed, 627 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 3c1f26f32351..097086d75d1c 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -32,6 +32,18 @@ static void netfs_set_group(struct folio *folio, struct netfs_group *netfs_group
 		folio_attach_private(folio, netfs_get_group(netfs_group));
 }
 
+#if IS_ENABLED(CONFIG_FSCACHE)
+static void netfs_folio_start_fscache(bool caching, struct folio *folio)
+{
+	if (caching)
+		folio_start_fscache(folio);
+}
+#else
+static void netfs_folio_start_fscache(bool caching, struct folio *folio)
+{
+}
+#endif
+
 /*
  * Decide how we should modify a folio.  We might be attempting to do
  * write-streaming, in which case we don't want to a local RMW cycle if we can
@@ -472,3 +484,616 @@ vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_gr
 	return ret;
 }
 EXPORT_SYMBOL(netfs_page_mkwrite);
+
+/*
+ * Kill all the pages in the given range
+ */
+static void netfs_kill_pages(struct address_space *mapping,
+			     loff_t start, loff_t len)
+{
+	struct folio *folio;
+	pgoff_t index = start / PAGE_SIZE;
+	pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
+
+	_enter("%llx-%llx", start, start + len - 1);
+
+	do {
+		_debug("kill %lx (to %lx)", index, last);
+
+		folio = filemap_get_folio(mapping, index);
+		if (IS_ERR(folio)) {
+			next = index + 1;
+			continue;
+		}
+
+		next = folio_next_index(folio);
+
+		folio_clear_uptodate(folio);
+		folio_end_writeback(folio);
+		folio_lock(folio);
+		trace_netfs_folio(folio, netfs_folio_trace_kill);
+		generic_error_remove_page(mapping, &folio->page);
+		folio_unlock(folio);
+		folio_put(folio);
+
+	} while (index = next, index <= last);
+
+	_leave("");
+}
+
+/*
+ * Redirty all the pages in a given range.
+ */
+static void netfs_redirty_pages(struct address_space *mapping,
+				loff_t start, loff_t len)
+{
+	struct folio *folio;
+	pgoff_t index = start / PAGE_SIZE;
+	pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
+
+	_enter("%llx-%llx", start, start + len - 1);
+
+	do {
+		_debug("redirty %llx @%llx", len, start);
+
+		folio = filemap_get_folio(mapping, index);
+		if (IS_ERR(folio)) {
+			next = index + 1;
+			continue;
+		}
+
+		next = folio_next_index(folio);
+		trace_netfs_folio(folio, netfs_folio_trace_redirty);
+		filemap_dirty_folio(mapping, folio);
+		folio_end_writeback(folio);
+		folio_put(folio);
+	} while (index = next, index <= last);
+
+	balance_dirty_pages_ratelimited(mapping);
+
+	_leave("");
+}
+
+/*
+ * Completion of write to server
+ */
+static void netfs_pages_written_back(struct netfs_io_request *wreq)
+{
+	struct address_space *mapping = wreq->mapping;
+	struct netfs_folio *finfo;
+	struct netfs_group *group = NULL;
+	struct folio *folio;
+	pgoff_t last;
+	int gcount = 0;
+
+	XA_STATE(xas, &mapping->i_pages, wreq->start / PAGE_SIZE);
+
+	_enter("%llx-%llx", wreq->start, wreq->start + wreq->len);
+
+	rcu_read_lock();
+
+	last = (wreq->start + wreq->len - 1) / PAGE_SIZE;
+	xas_for_each(&xas, folio, last) {
+		WARN(!folio_test_writeback(folio),
+		     "bad %zx @%llx page %lx %lx\n",
+		     wreq->len, wreq->start, folio_index(folio), last);
+
+		if ((finfo = netfs_folio_info(folio))) {
+			/* Streaming writes cannot be redirtied whilst under
+			 * writeback, so discard the streaming record.
+			 */
+			folio_detach_private(folio);
+			group = finfo->netfs_group;
+			gcount++;
+			trace_netfs_folio(folio, netfs_folio_trace_clear_s);
+		} else if ((group = netfs_folio_group(folio))) {
+			/* Need to detach the group pointer if the page didn't
+			 * get redirtied.  If it has been redirtied, then it
+			 * must be within the same group.
+			 */
+			if (folio_test_dirty(folio)) {
+				trace_netfs_folio(folio, netfs_folio_trace_redirtied);
+				goto end_wb;
+			}
+			if (folio_trylock(folio)) {
+				if (!folio_test_dirty(folio)) {
+					folio_detach_private(folio);
+					gcount++;
+					trace_netfs_folio(folio, netfs_folio_trace_clear_g);
+				} else {
+					trace_netfs_folio(folio, netfs_folio_trace_redirtied);
+				}
+				folio_unlock(folio);
+				goto end_wb;
+			}
+
+			xas_pause(&xas);
+			rcu_read_unlock();
+			folio_lock(folio);
+			if (!folio_test_dirty(folio)) {
+				folio_detach_private(folio);
+				gcount++;
+				trace_netfs_folio(folio, netfs_folio_trace_clear_g);
+			} else {
+				trace_netfs_folio(folio, netfs_folio_trace_redirtied);
+			}
+			folio_unlock(folio);
+			rcu_read_lock();
+		} else {
+			trace_netfs_folio(folio, netfs_folio_trace_clear);
+		}
+	end_wb:
+		folio_end_writeback(folio);
+	}
+
+	rcu_read_unlock();
+	netfs_put_group_many(group, gcount);
+	_leave("");
+}
+
+/*
+ * Deal with the disposition of the folios that are under writeback to close
+ * out the operation.
+ */
+static void netfs_cleanup_buffered_write(struct netfs_io_request *wreq)
+{
+	struct address_space *mapping = wreq->mapping;
+
+	_enter("");
+
+	switch (wreq->error) {
+	case 0:
+		netfs_pages_written_back(wreq);
+		break;
+
+	default:
+		pr_notice("R=%08x Unexpected error %d\n", wreq->debug_id, wreq->error);
+		fallthrough;
+	case -EACCES:
+	case -EPERM:
+	case -ENOKEY:
+	case -EKEYEXPIRED:
+	case -EKEYREJECTED:
+	case -EKEYREVOKED:
+	case -ENETRESET:
+	case -EDQUOT:
+	case -ENOSPC:
+		netfs_redirty_pages(mapping, wreq->start, wreq->len);
+		break;
+
+	case -EROFS:
+	case -EIO:
+	case -EREMOTEIO:
+	case -EFBIG:
+	case -ENOENT:
+	case -ENOMEDIUM:
+	case -ENXIO:
+		netfs_kill_pages(mapping, wreq->start, wreq->len);
+		break;
+	}
+
+	if (wreq->error)
+		mapping_set_error(mapping, wreq->error);
+	if (wreq->netfs_ops->done)
+		wreq->netfs_ops->done(wreq);
+}
+
+/*
+ * Extend the region to be written back to include subsequent contiguously
+ * dirty pages if possible, but don't sleep while doing so.
+ *
+ * If this page holds new content, then we can include filler zeros in the
+ * writeback.
+ */
+static void netfs_extend_writeback(struct address_space *mapping,
+				   struct netfs_group *group,
+				   struct xa_state *xas,
+				   long *_count,
+				   loff_t start,
+				   loff_t max_len,
+				   bool caching,
+				   size_t *_len)
+{
+	struct netfs_folio *finfo;
+	struct folio_batch fbatch;
+	struct folio *folio;
+	unsigned int i;
+	pgoff_t index = (start + *_len) / PAGE_SIZE;
+	size_t len;
+	void *priv;
+	bool stop = true;
+
+	folio_batch_init(&fbatch);
+
+	do {
+		/* Firstly, we gather up a batch of contiguous dirty pages
+		 * under the RCU read lock - but we can't clear the dirty flags
+		 * there if any of those pages are mapped.
+		 */
+		rcu_read_lock();
+
+		xas_for_each(xas, folio, ULONG_MAX) {
+			stop = true;
+			if (xas_retry(xas, folio))
+				continue;
+			if (xa_is_value(folio))
+				break;
+			if (folio_index(folio) != index)
+				break;
+
+			priv = rcu_dereference(*(__force void __rcu **)&folio->private);
+			if ((const struct netfs_group *)priv != group) {
+				finfo = (void *)((unsigned long)priv & ~NETFS_FOLIO_INFO);
+				if (finfo->netfs_group != group)
+					break;
+				if (finfo->dirty_offset > 0)
+					break;
+			}
+
+			if (!folio_try_get_rcu(folio)) {
+				xas_reset(xas);
+				continue;
+			}
+
+			/* Has the folio moved or been split? */
+			if (unlikely(folio != xas_reload(xas))) {
+				folio_put(folio);
+				break;
+			}
+
+			if (!folio_trylock(folio)) {
+				folio_put(folio);
+				break;
+			}
+			if (!folio_test_dirty(folio) ||
+			    folio_test_writeback(folio) ||
+			    folio_test_fscache(folio)) {
+				folio_unlock(folio);
+				folio_put(folio);
+				break;
+			}
+
+			stop = false;
+			len = folio_size(folio);
+			priv = folio->private;
+			if ((const struct netfs_group *)priv != group) {
+				stop = true;
+				finfo = (void *)((unsigned long)priv & ~NETFS_FOLIO_INFO);
+				if (finfo->netfs_group != group ||
+				    finfo->dirty_offset > 0) {
+					folio_unlock(folio);
+					folio_put(folio);
+					break;
+				}
+				len = finfo->dirty_len;
+			}
+
+			index += folio_nr_pages(folio);
+			*_count -= folio_nr_pages(folio);
+			*_len += len;
+			if (*_len >= max_len || *_count <= 0)
+				stop = true;
+
+			if (!folio_batch_add(&fbatch, folio))
+				break;
+			if (stop)
+				break;
+		}
+
+		xas_pause(xas);
+		rcu_read_unlock();
+
+		/* Now, if we obtained any folios, we can shift them to being
+		 * writable and mark them for caching.
+		 */
+		if (!folio_batch_count(&fbatch))
+			break;
+
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			folio = fbatch.folios[i];
+			trace_netfs_folio(folio, netfs_folio_trace_store_plus);
+
+			if (!folio_clear_dirty_for_io(folio))
+				BUG();
+			folio_start_writeback(folio);
+			netfs_folio_start_fscache(caching, folio);
+			folio_unlock(folio);
+		}
+
+		folio_batch_release(&fbatch);
+		cond_resched();
+	} while (!stop);
+}
+
+/*
+ * Synchronously write back the locked page and any subsequent non-locked dirty
+ * pages.
+ */
+static ssize_t netfs_write_back_from_locked_folio(struct address_space *mapping,
+						  struct writeback_control *wbc,
+						  struct netfs_group *group,
+						  struct xa_state *xas,
+						  struct folio *folio,
+						  unsigned long long start,
+						  unsigned long long end)
+{
+	struct netfs_io_request *wreq;
+	struct netfs_folio *finfo;
+	struct netfs_inode *ctx = netfs_inode(mapping->host);
+	unsigned long long i_size = i_size_read(&ctx->inode);
+	size_t len, max_len;
+	bool caching = netfs_is_cache_enabled(ctx);
+	long count = wbc->nr_to_write;
+	int ret;
+
+	_enter(",%lx,%llx-%llx,%u", folio_index(folio), start, end, caching);
+
+	wreq = netfs_alloc_request(mapping, NULL, start, folio_size(folio),
+				   NETFS_WRITEBACK);
+	if (IS_ERR(wreq))
+		return PTR_ERR(wreq);
+
+	if (!folio_clear_dirty_for_io(folio))
+		BUG();
+	folio_start_writeback(folio);
+	netfs_folio_start_fscache(caching, folio);
+
+	count -= folio_nr_pages(folio);
+
+	/* Find all consecutive lockable dirty pages that have contiguous
+	 * written regions, stopping when we find a page that is not
+	 * immediately lockable, is not dirty or is missing, or we reach the
+	 * end of the range.
+	 */
+	trace_netfs_folio(folio, netfs_folio_trace_store);
+
+	len = folio_size(folio);
+	finfo = netfs_folio_info(folio);
+	if (finfo) {
+		start += finfo->dirty_offset;
+		if (finfo->dirty_offset + finfo->dirty_len != len) {
+			len = finfo->dirty_len;
+			goto cant_expand;
+		}
+		len = finfo->dirty_len;
+	}
+
+	if (start < i_size) {
+		/* Trim the write to the EOF; the extra data is ignored.  Also
+		 * put an upper limit on the size of a single storedata op.
+		 */
+		max_len = 65536 * 4096;
+		max_len = min_t(unsigned long long, max_len, end - start + 1);
+		max_len = min_t(unsigned long long, max_len, i_size - start);
+
+		if (len < max_len)
+			netfs_extend_writeback(mapping, group, xas, &count,
+					       start, max_len, caching, &len);
+	}
+
+cant_expand:
+	len = min_t(unsigned long long, len, i_size - start);
+
+	/* We now have a contiguous set of dirty pages, each with writeback
+	 * set; the first page is still locked at this point, but all the rest
+	 * have been unlocked.
+	 */
+	folio_unlock(folio);
+	wreq->start = start;
+	wreq->len = len;
+
+	if (start < i_size) {
+		_debug("write back %zx @%llx [%llx]", len, start, i_size);
+
+		/* Speculatively write to the cache.  We have to fix this up
+		 * later if the store fails.
+		 */
+		wreq->cleanup = netfs_cleanup_buffered_write;
+
+		iov_iter_xarray(&wreq->iter, ITER_SOURCE, &mapping->i_pages, start, len);
+		__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
+		ret = netfs_begin_write(wreq, true, netfs_write_trace_writeback);
+		if (ret == 0 || ret == -EIOCBQUEUED)
+			wbc->nr_to_write -= len / PAGE_SIZE;
+	} else {
+		_debug("write discard %zx @%llx [%llx]", len, start, i_size);
+
+		/* The dirty region was entirely beyond the EOF. */
+		fscache_clear_page_bits(mapping, start, len, caching);
+		netfs_pages_written_back(wreq);
+		ret = 0;
+	}
+
+	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
+	_leave(" = 0");
+	return 0;
+}
+
+/*
+ * Write a region of pages back to the server
+ */
+static ssize_t netfs_writepages_begin(struct address_space *mapping,
+				      struct writeback_control *wbc,
+				      struct netfs_group *group,
+				      struct xa_state *xas,
+				      unsigned long long *_start,
+				      unsigned long long end)
+{
+	const struct netfs_folio *finfo;
+	struct folio *folio;
+	unsigned long long start = *_start;
+	ssize_t ret;
+	void *priv;
+	int skips = 0;
+
+	_enter("%llx,%llx,", start, end);
+
+search_again:
+	/* Find the first dirty page in the group. */
+	rcu_read_lock();
+
+	for (;;) {
+		folio = xas_find_marked(xas, end / PAGE_SIZE, PAGECACHE_TAG_DIRTY);
+		if (xas_retry(xas, folio) || xa_is_value(folio))
+			continue;
+		if (!folio)
+			break;
+
+		/* Skip any dirty folio that's not in the group of interest. */
+		priv = rcu_dereference(*(__force void __rcu **)&folio->private);
+		if ((const struct netfs_group *)priv != group) {
+			finfo = (void *)((unsigned long)priv & ~NETFS_FOLIO_INFO);
+			if (finfo->netfs_group != group)
+				continue;
+		}
+
+		if (!folio_try_get_rcu(folio)) {
+			xas_reset(xas);
+			continue;
+		}
+
+		if (unlikely(folio != xas_reload(xas))) {
+			folio_put(folio);
+			xas_reset(xas);
+			continue;
+		}
+
+		xas_pause(xas);
+		break;
+	}
+	rcu_read_unlock();
+	if (!folio)
+		return 0;
+
+	start = folio_pos(folio); /* May regress with THPs */
+
+	_debug("wback %lx", folio_index(folio));
+
+	/* At this point we hold neither the i_pages lock nor the page lock:
+	 * the page may be truncated or invalidated (changing page->mapping to
+	 * NULL), or even swizzled back from swapper_space to tmpfs file
+	 * mapping
+	 */
+lock_again:
+	if (wbc->sync_mode != WB_SYNC_NONE) {
+		ret = folio_lock_killable(folio);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (!folio_trylock(folio))
+			goto search_again;
+	}
+
+	if (folio->mapping != mapping ||
+	    !folio_test_dirty(folio)) {
+		start += folio_size(folio);
+		folio_unlock(folio);
+		goto search_again;
+	}
+
+	if (folio_test_writeback(folio) ||
+	    folio_test_fscache(folio)) {
+		folio_unlock(folio);
+		if (wbc->sync_mode != WB_SYNC_NONE) {
+			folio_wait_writeback(folio);
+#ifdef CONFIG_NETFS_FSCACHE
+			folio_wait_fscache(folio);
+#endif
+			goto lock_again;
+		}
+
+		start += folio_size(folio);
+		if (wbc->sync_mode == WB_SYNC_NONE) {
+			if (skips >= 5 || need_resched()) {
+				ret = 0;
+				goto out;
+			}
+			skips++;
+		}
+		goto search_again;
+	}
+
+	ret = netfs_write_back_from_locked_folio(mapping, wbc, group, xas,
+						 folio, start, end);
+out:
+	if (ret > 0)
+		*_start = start + ret;
+	_leave(" = %zd [%llx]", ret, *_start);
+	return ret;
+}
+
+/*
+ * Write a region of pages back to the server
+ */
+static int netfs_writepages_region(struct address_space *mapping,
+				   struct writeback_control *wbc,
+				   struct netfs_group *group,
+				   unsigned long long *_start,
+				   unsigned long long end)
+{
+	ssize_t ret;
+
+	XA_STATE(xas, &mapping->i_pages, *_start / PAGE_SIZE);
+
+	do {
+		ret = netfs_writepages_begin(mapping, wbc, group, &xas,
+					     _start, end);
+		if (ret > 0 && wbc->nr_to_write > 0)
+			cond_resched();
+	} while (ret > 0 && wbc->nr_to_write > 0);
+
+	return ret > 0 ? 0 : ret;
+}
+
+/*
+ * write some of the pending data back to the server
+ */
+int netfs_writepages(struct address_space *mapping,
+		     struct writeback_control *wbc)
+{
+	struct netfs_group *group = NULL;
+	loff_t start, end;
+	int ret;
+
+	_enter("");
+
+	/* We have to be careful as we can end up racing with setattr()
+	 * truncating the pagecache since the caller doesn't take a lock here
+	 * to prevent it.
+	 */
+
+	if (wbc->range_cyclic && mapping->writeback_index) {
+		start = mapping->writeback_index * PAGE_SIZE;
+		ret = netfs_writepages_region(mapping, wbc, group,
+					      &start, LLONG_MAX);
+		if (ret < 0)
+			goto out;
+
+		if (wbc->nr_to_write <= 0) {
+			mapping->writeback_index = start / PAGE_SIZE;
+			goto out;
+		}
+
+		start = 0;
+		end = mapping->writeback_index * PAGE_SIZE;
+		mapping->writeback_index = 0;
+		ret = netfs_writepages_region(mapping, wbc, group, &start, end);
+		if (ret == 0)
+			mapping->writeback_index = start / PAGE_SIZE;
+	} else if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX) {
+		start = 0;
+		ret = netfs_writepages_region(mapping, wbc, group,
+					      &start, LLONG_MAX);
+		if (wbc->nr_to_write > 0 && ret == 0)
+			mapping->writeback_index = start / PAGE_SIZE;
+	} else {
+		start = wbc->range_start;
+		ret = netfs_writepages_region(mapping, wbc, group,
+					      &start, wbc->range_end);
+	}
+
+out:
+	_leave(" = %d", ret);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_writepages);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 2ab989407dcb..02a8ddddc8cd 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -402,6 +402,8 @@ int netfs_read_folio(struct file *, struct folio *);
 int netfs_write_begin(struct netfs_inode *, struct file *,
 		      struct address_space *, loff_t pos, unsigned int len,
 		      struct folio **, void **fsdata);
+int netfs_writepages(struct address_space *mapping,
+		     struct writeback_control *wbc);
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp);
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

