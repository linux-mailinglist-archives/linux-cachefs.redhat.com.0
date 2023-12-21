Return-Path: <linux-cachefs+bncBDLIXLMFVAERBNPZSCWAMGQENH6U5NI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D981B761
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:10 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67f5328f5a6sf11317066d6.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165109; cv=pass;
        d=google.com; s=arc-20160816;
        b=zIXp9fmfi53jgttOwC/HMXCkrQfIUzyxwD5Lko4e6MGJD3jK6YLM9Bn7tVQd1+gGxL
         EhdvidQzRRNx8dX+lPydxwb9PFJqEnorai3VzntyuDuWYKl8h3oQRTj/V49AfIgcT0QW
         AwR3CJYBT1YDBqf1WtY5wiUaaeDHYW/kSzNoASbY9W0rzEa7FKwPhSDkcSuKErDDte7j
         b9Tpi0VYiTMt68vAaL+SDjmGLeAYgJUxb2V1jiXjXTc6Pnu5sNXF4CZWHhwY9B88jG52
         s0y1GaXVGdaFs9rYkDUa3EkYyxoMXN+keS5KA6VgUgm9fJ4xrH23Ce0j3d6WUmtubzlc
         T9mA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/NVLy+kX5jbivXq5CNp5IBvkoReE2Lh6C617aUsO9A4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=s0WANe31l9HhJhUcOGUVsYz+zU6wdlHDiUtbJXW/Hu8A8AyDSf1jrrxxWichSZE3OT
         XGJZfxT53f3KrGXRqRjk/hEnoCJot8exhcsv3ZPGXyod3uRhPGwyoDYRQnF/ykk7Z/ZO
         rfvVTF8logGt6vf1yJ3o63CjIuA92Dta3XzbjWC7Ogku3bny5rHG6XQhgKD5iSRd4WiU
         CCY+wIMEaA8urLqlkqvJAI9IbLj8aQr38mITA29T6Tz65MDNVkw3tEy8U0I9VHvn/uBC
         Bv2leNoCYvfVXkxwc2r3Bm+/hVlawbbuCoIDTMvjbB5V1Ux6svvADSLfB6byt3B2/t0e
         eY7A==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165109; x=1703769909;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NVLy+kX5jbivXq5CNp5IBvkoReE2Lh6C617aUsO9A4=;
        b=J/HfQo5/yXhBMU0WGHUIxisnjHR4XCI5G0E8LISYi5lN7nqOInpzS6ruVtbqJsWsC2
         0ijRF/8aUhaYB9mCc2NvZI+snQ/L76dItBhQTsv/PygjUEGo4vy+F5DkN3j++QIgWYsn
         +cbEAuI0NJ6lkoDaZPNUUk03SrN7LoB+Tx7/JGLjdqsnoJPXq5Es1zaYwdUfV1kd01Tq
         iuevfdSWQA5FzLWRBlf0A/SaFLgFvJ8A6cvUsoKPcq1To8XaGn3hxHCTsvhjSAr8NaGZ
         SNxrLWFamIUSnlUN3ak5hf3pMCpgR44Pz+BxiaJMwIvHtZepQUa9OEKCV5rB8+Z/OrBw
         EDTA==
X-Gm-Message-State: AOJu0Yy8rGtXd9qXcQiJvNhco4VD6PPgJnFn2vLx4dE2fI4qusXR8oF8
	6cv1S5ufrYobIGvk535OEyCsHg==
X-Google-Smtp-Source: AGHT+IE8qhDlsJW9D/byS9Xgo07NcJQcOk1u0pK6ppAHvJtBHXkBHyxsw85QECPLBt28JKad0lNfIQ==
X-Received: by 2002:a05:6214:412:b0:67f:4f48:d156 with SMTP id z18-20020a056214041200b0067f4f48d156mr7489193qvx.71.1703165109661;
        Thu, 21 Dec 2023 05:25:09 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:5007:b0:679:fa52:346a with SMTP id
 jo7-20020a056214500700b00679fa52346als1389722qvb.0.-pod-prod-09-us; Thu, 21
 Dec 2023 05:25:09 -0800 (PST)
X-Received: by 2002:ad4:5c88:0:b0:67f:fe7:c30c with SMTP id o8-20020ad45c88000000b0067f0fe7c30cmr20517578qvh.124.1703165109131;
        Thu, 21 Dec 2023 05:25:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165109; cv=none;
        d=google.com; s=arc-20160816;
        b=CMdZjZmsXwt/VKvLOKOg/axMg0epS2HXThyCxn3BVv3BkG7K0yZeJE4YIP/p+5HGiP
         /AJpPoHcKrgjdhI9XAbhOhyLyYvBjGswAj1U49Vs+QJhEoJhppNC23lVwzE9MseXZQOE
         uJvLuGJqxF6wKMbd0vGpetUSjMBl7FTdAQ2e+QxAsDKTda/9fReukm/VRwf+7PFSanow
         aKhHxGxTTwSzdg/klKeFh8hFTiZa/EQYJLX5oRZ51nNGo2jRmOO5fGDpRWQNaQuIbJhr
         CB+ABe0fEwK5ILFAwKMzL8shOzhDT5AmEF4BkwS24e+9mzJ/+XBUVLUNppE1UyXXOLFl
         2jIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Ppqe5/eIonwrzZ/jLo8c72gfFpAvKrjxuqv7T89lrl4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=mjTEiKb7b5w/16ZUirIOPIdruaInTpGSc23cgrP2shy4gBIHudW4EpZRojFB7U24eL
         jNOAQGT5H/YTC3AkMq5EygRDf7Y05lliQvB4VeMLcDeEloY5Tgu37t+tf/vzKHAU0UiK
         YVXjyaQsI7CVTXltleD+LD4ZauI4Ujs5pOENYWNBqSnSRo5FsSBXV4qDb3u1HmLvlR/Y
         YCrsNERZzs3uDL0BxYFcxr4vSD+N9UQsegrIF2/jTxlqH918X14t3knDtE+OZyCFxYFs
         7dlbxnoSX6/frZz5Yt0Zc6zK/qzNOCqfDqjaNO1UO9tTD1s1/caAKxJwZ4HtikwiJbVy
         1CrA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id q6-20020a0ce206000000b0067a29f9abdasi569186qvl.438.2023.12.21.05.25.09
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:09 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-baP-Em-BPv6A9emBqsLPdA-1; Thu, 21 Dec 2023 08:25:07 -0500
X-MC-Unique: baP-Em-BPv6A9emBqsLPdA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98074185A783
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 95516492BC6; Thu, 21 Dec 2023 13:25:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1273492BC7;
	Thu, 21 Dec 2023 13:25:03 +0000 (UTC)
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
Subject: [PATCH v5 16/40] netfs: Provide tools to create a buffer in an xarray
Date: Thu, 21 Dec 2023 13:23:11 +0000
Message-ID: <20231221132400.1601991-17-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h   | 13 +++++++
 fs/netfs/misc.c       | 81 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  4 +++
 3 files changed, 98 insertions(+)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 4708fb15446b..b908c7e0a901 100644
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
index 45bb19ec9a63..5d545073fe03 100644
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

