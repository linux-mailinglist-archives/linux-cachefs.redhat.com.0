Return-Path: <linux-cachefs+bncBDLIXLMFVAERBTEZ46VQMGQEDADXM7A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF31811646
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:01 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425b65b94e7sf66340401cf.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481100; cv=pass;
        d=google.com; s=arc-20160816;
        b=DiGAlw8SIDrTYYYD+vqtU8ZCw7scQ+1rN4wYt0nQQckEOMr0MYNvqsODsip94nSZzi
         hhYbeMIg81o1Bqff3MJNbFWml3ZhWMVRumadPpHqcRMwDTOA0qObiUWHhTEQkxbCBZbR
         Jet3FKM/4R9ecw2TVHgZD9XUnSqZmrD3FcSqzNKFIiy59Oubo2KIpBQb9vZxcAs9jDOC
         gQAISQsk//SnGUHXNSPS32ykCmyq6kDgWdq/HUeah3VjztMVZlPTPjzW5TeMSrVn3Thc
         OJANwtiPXnSwYZBLQfFgMc7w6CGcikJpAzftYdmNJBM35YP+fXKXS9GIb/Z27KeGXWnf
         3YMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VXrvJa18oXRGXHccXiCH4DQhAGWJLR9UE0m51CDlFwI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=fiAZBEdxzf1DRf3jf55ymtYqYmgqASMZAr5vqcH/5aZ5R8Rud4SUJxLDZPZPd+wkMX
         GUedkMF/xj3d17OS+GCyqBxHol1MAhATl14tBdq3o74oUkaqSWC+zW6RSqOmSpsgCOai
         TqtOsr8Wo7rR4sXTt9ulyiA9De5o0CldfYZ1+Bu/5jZVOQdpPw6Pn9+RYmaSMfIQyMB8
         LghJBnFvALdzfUipoPCifm8h6ivLuBPRNYGaHm0yF1NebCI3IxSF73ah2tDCrEJDaRYq
         AMhZ3fMCom1Jfj81J+Fhl4pjEkjSp0C/fPDNcN1cKca2QahL4OyOHkGNxBXcjWObdVzq
         uHmQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481100; x=1703085900;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXrvJa18oXRGXHccXiCH4DQhAGWJLR9UE0m51CDlFwI=;
        b=A3AFnqbKtKgrzutOcTdqHbpOjmQVhj75qpWx/oh2oe8zHazlPaHSyZc16H8XsFrlmz
         J+tXhYgntXSedkfP0hXBjt1d+ERKExQM5DrZH+PHDEfNPN1Bz2lIfWXzbJAjWVQ6D09W
         KY8MB2B1qyACuvdLJj1PMh7K3FZpUHaCW4w4/lzGYHz55uhcO/frZdsyGtvAxNIu7Cq5
         C1ibbhcQnAAc1XS6WIhwgsj/5gpTw5+agCT32z9S+okhcXabcsdi2HLCLpJR6O1C1bVM
         WSosesb/dIutStvGctkeCc+ZfQbvFOLq+uBKJ8yMZXQnduteiV1Qq6eA1g8iE7iOjLHd
         yOiA==
X-Gm-Message-State: AOJu0YwYH/CeU+O05bcX411zkBcFms4uTwvP5w1Y2/qqylHjgSKBn871
	9iCrBEL7+vxBfxVzZK1lli7WuA==
X-Google-Smtp-Source: AGHT+IEPBVh/CjVptPOZQSXnvVISHAbYtiNeAKs0tuzeTK1UdQsWxUx1VGgjjAW8DrCTRZUZ5kyylQ==
X-Received: by 2002:a05:622a:8d:b0:425:4043:41cc with SMTP id o13-20020a05622a008d00b00425404341ccmr13066528qtw.120.1702481100409;
        Wed, 13 Dec 2023 07:25:00 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:425:7ea5:45f0 with SMTP id
 a17-20020a05622a065100b004257ea545f0ls7894759qtb.2.-pod-prod-04-us; Wed, 13
 Dec 2023 07:24:59 -0800 (PST)
X-Received: by 2002:ae9:e90d:0:b0:77f:80c:53a5 with SMTP id x13-20020ae9e90d000000b0077f080c53a5mr8761710qkf.102.1702481099809;
        Wed, 13 Dec 2023 07:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481099; cv=none;
        d=google.com; s=arc-20160816;
        b=SrXXyljCJEHFiN0jAdZnXPl8A3LgHoy3eHBHccK+VHtgGvVIj6QpUgjb2xep2B7cDd
         PYupr3+5NUfTDOevfjddwIbTCTzABliB6BAI1ZUBayjXl6igmA26foVPpWCysFevxfSa
         oYZKK09nXTwTz3nZne9xKrSRet3Vlp/W8zOuhpogumrk5yrYh/On/Waj+eZ8d/hPvF5/
         aCfZeEJcYDasO4YZIDMyvwN41Cc8NLKipiASSj4kPmL/xHqWZHhWY1E0k2zQHK0mbA6f
         nBLL8haRSEjxEQXYHqqpl+T88W0j2ozBpbbKxa6v24ZsorssTzHdZBGKdXD0hnXsQWLf
         oEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=PLa1FYhVvXUSTtOx9SWX7UrxEmhpA+746l5QW31q7Os=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=zbosbgm31jzWU44agPCyhWPD/fO0AYxGM3QBauXYLT835OUV/OOCqJmCzExOCoAKuv
         f9Ex7+AbeSx+8kW6v7qTPNeKhDSSlvjgefqGTIHj7bol8tVd/jbJ+AA6EgFdxku4eAJN
         +D/RQIadiUn+OuK3s2xpalBB4ARClpap8Q0EeMzMWYdDiRJdLH815XdTIVUo2oJ5ZWNT
         A6v/cn50QQP23M9pqe7SUbSnzyReumY3xImPHc+Zk5/U624ho4bfCLzQb8z+4ZM/5mfh
         xPiviBpZRp5CFKAmipYCjzEpAZlV9tuwN2dUvBl5d/IpbvTH0Vuk/PHa8zC5gEzzBOSe
         pSiw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id s8-20020a05620a29c800b0077dc416a858si9540148qkp.105.2023.12.13.07.24.59
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-SAxf4uoAPbiUwZx2UkrAig-1; Wed, 13 Dec 2023 10:24:55 -0500
X-MC-Unique: SAxf4uoAPbiUwZx2UkrAig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AFAD88F5A6
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 978DF40C6E2C; Wed, 13 Dec 2023 15:24:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD2A340C6EBA;
	Wed, 13 Dec 2023 15:24:51 +0000 (UTC)
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
Subject: [PATCH v4 14/39] netfs: Provide tools to create a buffer in an xarray
Date: Wed, 13 Dec 2023 15:23:24 +0000
Message-ID: <20231213152350.431591-15-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
index 937d9a22f178..20eb1fd6986e 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -56,6 +56,19 @@ static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq) {}
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
index d946d85764de..96014c3d1683 100644
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
  * netfs_dirty_folio - Mark folio dirty and pin a cache object for writeback
  * @mapping: The mapping the folio belongs to.
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index bbb33ccbf719..c05150f51beb 100644
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

