Return-Path: <linux-cachefs+bncBDLIXLMFVAERBKNQ36VAMGQECSONLGI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 842127EF96D
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:26 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41cb577d45asf25860581cf.3
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255785; cv=pass;
        d=google.com; s=arc-20160816;
        b=syLeFjRodYIWpGYuGn+iTQh+I+3VDJdJQXzLKbDX/Sp2z/Pcm2MOKqUUmvNiCS+uch
         g0Xh2G1rcZFH5KsT2e44i9w59N39mh7k+kRscH6S92kzZ6TLRffd1fmL+24j9lLIaSR2
         B7qchKTWVXC2kNMcVTjp6R7LjFE/WaDmNM/veTDaDS9OXKA3fEWo5VHdbCekcbjPtZRK
         oftXeuaA21pgZm8PnCpSp35rn1TzV0qpt76khKtUIF5lBcjwWSTeDuhsFirFhkK8C5TL
         hq9BPAaxwZ9vbzpLp1ng6FOwNjMOyBQaGIovrLkM1ltirCgoAcWk5Wp3lPEJ6m3U6VwF
         BrQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=JvR+XaknXXA1SQUUGaifuvKGJgRlJXcBJ3UJqjlNAWE=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=Hbd4umbarrzW6yK04jFLywGiEovUacqTLmLvLmcnXfZ211/yWLkrHMzJL7od6Gkffn
         cdKi4ERYhmmQj/Lix+rWiC9k9f51quK2aA76xUmb/YuimRhJHNS0qS3KnnyfVisqdiPS
         uzWz+PYQNTuokICR5zXAGRTAtzzZavrl/8xOZ6xpiwdI//HL+cqnz5CI1+ol66ZeOcBa
         /BIul7LiniSr2U4xEj5BWG7056WIj/eMrAjBXqKWNcvVmQew6iZKjy8lyLrMJdWEVhqL
         QKwx/6tb2BGbD5vzeXCZXc/fGoPJsqfU10HkzbZxoSlWQHeiZfMY/jLi1ku4j+Nh51LF
         kVYw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255785; x=1700860585;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvR+XaknXXA1SQUUGaifuvKGJgRlJXcBJ3UJqjlNAWE=;
        b=RWE9mT+1Ws8wxQqgfCrn/DCg8WYt7k/yxCAtv5EUcwRpCpLjSciPUtXpSi4Q4COXS+
         1rriITDA58FJXPskWsBytNCnIzxA4/TRGgSXSmYCalJzTtEa7P4tGwi+A8VdYCCfkkcf
         MULDKxIvXBkEie+wKFde4OXfWCNgJklYMY4TdJE7W/C3aj0SUwZvp4ubGj2AlilPRhtF
         6sBNpB1mMNU9taUyolcNDn21NCAzAlMltniH4Fw2fnclrumK+rilWQphNNS/yJnnx4oy
         0bH/XzCkEM/Qse0ogZVkYEDbTeN/eQZeFLtZJ5m2hzERmQB8PTwJHxn8SNyN9To66Wcf
         n1hA==
X-Gm-Message-State: AOJu0YxueKmJEV8dQKCFRZSUnKpv6xfYdLUug2jpGpAA7CaDRsLKYJpN
	8djp/Mnuw/C5bTsWrVWd+FbXEw==
X-Google-Smtp-Source: AGHT+IFodicURtDrqx7E3BpgAa7t5+lTdP2z6pEWuDeAg/M0IqU1h2TLYdRI8MJ7DVXSep1qWutvvw==
X-Received: by 2002:a05:622a:1c4:b0:41e:5470:2b1e with SMTP id t4-20020a05622a01c400b0041e54702b1emr1014248qtw.2.1700255785538;
        Fri, 17 Nov 2023 13:16:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:4184:b0:422:1bd:4708 with SMTP id
 cd4-20020a05622a418400b0042201bd4708ls1872850qtb.1.-pod-prod-01-us; Fri, 17
 Nov 2023 13:16:25 -0800 (PST)
X-Received: by 2002:a05:620a:6406:b0:774:2a7f:fa24 with SMTP id pz6-20020a05620a640600b007742a7ffa24mr791967qkn.25.1700255784898;
        Fri, 17 Nov 2023 13:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255784; cv=none;
        d=google.com; s=arc-20160816;
        b=GiZZdYtDqPN7/VeykEqZE7U1QIc65X2bRE8T9rk0U2CwYIHh99M5GW5R/R5sqKhEMZ
         ONTV9dGkygJs5v51SrV9oNswyJUPTQXHkVhF0+2bvycipcW2TyBNGjSOewcTZPZYiLs6
         qL1ruKjU9vSu4Uyrr7KRrVkJTQbxrIxszeEuqAiKYEDZYVBOb7X3RJdttQOdyrwWXlSb
         ZX+aANdskxEJwA06Unx8A55+3cmvhhNv9FazrBzNoaP8i3nZt9dgn0iRF/aVWei7izod
         gPw0ng94MMFi68SffSwC2DwwrGSW6deuruPozVbB2YpjV6Md0zHmBs7rfCJnWSjw7BRV
         JzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=mTplFuJpJrC57Jye0A7Rs4hbbfJuamUNfWOMgqHa0J4=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=wf1zlgy5slHgz53vecjmV9DwNZGDi/vH3at5Nrky6OfujGaRWeC+Al/w/Li/chxY+Q
         gGkelVsZ9n4L4T/rKecAhCUrkck2fRmqEqAk+ymO1elL+tfUPLEvdD2OH0LJP0vGFWoH
         lrP+m81EPBxUglNF87W+iqVUdtJZ3csdfRTmNQ/HVlpB4rXjVvqRHsxxaljUCWXh1qlW
         O8VeNZGq3LOSXlWM6WammnvK5VHX/9HfpjnSxWCAl8Xw0YjPMrHWfRuC3r4DEEyizQTH
         Q6yIopTwLlI8pbAG0xZDEH/kOlW17i1FtK7xWgID2eKL6HUEXi6ktabTo4+sU9gQL/Uo
         3MAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id h6-20020a05620a244600b0077091864d1esi2546563qkn.687.2023.11.17.13.16.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:24 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-pZJ8d-BHMnGJ3zUL_bV3NQ-1; Fri,
 17 Nov 2023 16:16:23 -0500
X-MC-Unique: pZJ8d-BHMnGJ3zUL_bV3NQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A5471C06369
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 06D9140C6EBB; Fri, 17 Nov 2023 21:16:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64D1040C6EB9;
	Fri, 17 Nov 2023 21:16:20 +0000 (UTC)
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
Subject: [PATCH v2 10/51] netfs: Provide tools to create a buffer in an xarray
Date: Fri, 17 Nov 2023 21:15:02 +0000
Message-ID: <20231117211544.1740466-11-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

Provide tools to create a buffer in an xarray, with a function to add new
folios with a mark.  This will be used to create bounce buffer and can be
used more easily to create a list of folios the span of which would require
more than a page's worth of bio_vec structs.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h   | 13 +++++++
 fs/netfs/misc.c       | 81 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  4 +++
 3 files changed, 98 insertions(+)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 1f067aa96c50..21a47f118009 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -52,6 +52,19 @@ static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq) {}
 static inline void netfs_proc_del_rreq(struct netfs_io_request *rreq) {}
 #endif
 
+/*
+ * misc.c
+ */
+#define NETFS_FLAG_PUT_MARK		BIT(0)
+#define NETFS_FLAG_PAGECACHE_MARK	BIT(1)
+int netfs_xa_store_and_mark(struct xarray *xa, unsigned long index,
+			    struct folio *folio, unsigned int flags,
+			    gfp_t gfp_mask);
+int netfs_add_folios_to_buffer(struct xarray *buffer,
+			       struct address_space *mapping,
+			       pgoff_t index, pgoff_t to, gfp_t gfp_mask);
+void netfs_clear_buffer(struct xarray *buffer);
+
 /*
  * objects.c
  */
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index c3baf2b247d9..106f2fbdccd8 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -8,6 +8,87 @@
 #include <linux/swap.h>
 #include "internal.h"
 
+/*
+ * Attach a folio to the buffer and maybe set marks on it to say that we need
+ * to put the folio later and twiddle the pagecache flags.
+ */
+int netfs_xa_store_and_mark(struct xarray *xa, unsigned long index,
+			    struct folio *folio, unsigned int flags,
+			    gfp_t gfp_mask)
+{
+	XA_STATE_ORDER(xas, xa, index, folio_order(folio));
+
+retry:
+	xas_lock(&xas);
+	for (;;) {
+		xas_store(&xas, folio);
+		if (!xas_error(&xas))
+			break;
+		xas_unlock(&xas);
+		if (!xas_nomem(&xas, gfp_mask))
+			return xas_error(&xas);
+		goto retry;
+	}
+
+	if (flags & NETFS_FLAG_PUT_MARK)
+		xas_set_mark(&xas, NETFS_BUF_PUT_MARK);
+	if (flags & NETFS_FLAG_PAGECACHE_MARK)
+		xas_set_mark(&xas, NETFS_BUF_PAGECACHE_MARK);
+	xas_unlock(&xas);
+	return xas_error(&xas);
+}
+
+/*
+ * Create the specified range of folios in the buffer attached to the read
+ * request.  The folios are marked with NETFS_BUF_PUT_MARK so that we know that
+ * these need freeing later.
+ */
+int netfs_add_folios_to_buffer(struct xarray *buffer,
+			       struct address_space *mapping,
+			       pgoff_t index, pgoff_t to, gfp_t gfp_mask)
+{
+	struct folio *folio;
+	int ret;
+
+	if (to + 1 == index) /* Page range is inclusive */
+		return 0;
+
+	do {
+		/* TODO: Figure out what order folio can be allocated here */
+		folio = filemap_alloc_folio(readahead_gfp_mask(mapping), 0);
+		if (!folio)
+			return -ENOMEM;
+		folio->index = index;
+		ret = netfs_xa_store_and_mark(buffer, index, folio,
+					      NETFS_FLAG_PUT_MARK, gfp_mask);
+		if (ret < 0) {
+			folio_put(folio);
+			return ret;
+		}
+
+		index += folio_nr_pages(folio);
+	} while (index <= to && index != 0);
+
+	return 0;
+}
+
+/*
+ * Clear an xarray buffer, putting a ref on the folios that have
+ * NETFS_BUF_PUT_MARK set.
+ */
+void netfs_clear_buffer(struct xarray *buffer)
+{
+	struct folio *folio;
+	XA_STATE(xas, buffer, 0);
+
+	rcu_read_lock();
+	xas_for_each_marked(&xas, folio, ULONG_MAX, NETFS_BUF_PUT_MARK) {
+		folio_put(folio);
+	}
+	rcu_read_unlock();
+	xa_destroy(buffer);
+}
+
 /**
  * netfs_invalidate_folio - Invalidate or partially invalidate a folio
  * @folio: Folio proposed for release
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 6d820a860052..47270f5d9e89 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -109,6 +109,10 @@ static inline int wait_on_page_fscache_killable(struct page *page)
 	return folio_wait_private_2_killable(page_folio(page));
 }
 
+/* Marks used on xarray-based buffers */
+#define NETFS_BUF_PUT_MARK	XA_MARK_0	/* - Page needs putting  */
+#define NETFS_BUF_PAGECACHE_MARK XA_MARK_1	/* - Page needs wb/dirty flag wrangling */
+
 enum netfs_io_source {
 	NETFS_FILL_WITH_ZEROES,
 	NETFS_DOWNLOAD_FROM_SERVER,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

