Return-Path: <linux-cachefs+bncBDLIXLMFVAERBNPPZCVQMGQENJMVMSY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B2B809354
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:03 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4256dc90836sf17515231cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984182; cv=pass;
        d=google.com; s=arc-20160816;
        b=thBNZSd6gjW3ua8Gye7/EqsSOsDD9tG1WYvi49YemCk3GbXzCT7foCCFXRg5E31XA3
         pxNNsPX0LVcrv+mT5vpZDA9SNro5FOa3KDSQFoMJIcCofa4nlIiVulwIkLDeN9lePbFF
         lnaWi44Bor9r+dHD6Qo0i6YkrGN38VF6ClKTsWIUPKEoKJiZx6IwMaIrxUS7ka5YK2gR
         FbaIV5P5oLOSfXU3EalEwGA8g9Q+/BfUQCWP44xx+dJjIZbNg7NvfYjF/xSIGWYeNDio
         +Y6yVapmVNpWxVFgUlqz/Poj8c4sMIHce+hvx9asQ8jdAJ0g3llt5ZEAxXVHJISIB796
         nQjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=bq6+MxvKiRdbUiXpFtIenlvEc9OD+qphPhk+ydCeVGs=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=fVbYQQaLX8OP+hTJBFtxjL1rJYhSWL+RZTLODvUW1+P7U5SM+PB/LQstH5RE8K1VkN
         X45CjbP+34Xs+TpF+fF5JADIid6leDP04yQkC0qlH0a64u4SaE0oY/gxCLuuj/XhYT4n
         3SSeU5oELt7/jhgz9SqJkyHMnhMIDRbGHY3+ou6pEGf7cs9cZlyp2zprVEG3pECEQR6R
         BUIO/54V4e82iA7tTYgWwUfIt9VWgJScY0t4i18O9/6fNxD2M+oDDz49i08IJTFdj2Tp
         vUsjQqdWLeff8CWQ0c5UEet1uebkzvUpf6OtwWNhV21TOv3pl2qXNQVkHqMRKgUl2AQU
         ZdJw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984182; x=1702588982;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq6+MxvKiRdbUiXpFtIenlvEc9OD+qphPhk+ydCeVGs=;
        b=P0K3VX/P4linuydRaztyCpAogXoD/FKAqeYBeBZDxvH5XUBVAIrslbOUT02ruOb8FX
         2HnAOQBG+jKgmUic72KQNzeoPOLP6pjhVuce5GJa+zWoYzn7mzkKpUWD6hzNHbZwdDyw
         Auu4kTlaZEra+l+GQh5ty99EkIcDxT5Cu2RunbuB7SKms6CQFO2P611Ujdl44dNwloFy
         D1hwC2rnf2GDYmapnte3eH6R1GWbXwbG/Pw+jtefK6STzh9+FXoOXv+SdipP80It1+cJ
         AAX0EAN8k7kTa6+p8/Eoo4SEseERbpuN+kh9811VEWAJILmcd5S4aTcXsSOUuKIqF9/G
         E70g==
X-Gm-Message-State: AOJu0YwhwK93ST1VrDUtITBsKDP5uC3OKCGBAWowUUl4Dxi3wxYCm0Nf
	DsDAUH34LdlJhVbkE/OQy3xpGA==
X-Google-Smtp-Source: AGHT+IFDAicZtsEDtPP2CTc7u59qfk9qxQVASsfH7cIh0dKyCio3qP464l8vf83gHgbi4bZsKoBi6w==
X-Received: by 2002:ac8:5cc5:0:b0:425:4340:dc9e with SMTP id s5-20020ac85cc5000000b004254340dc9emr3958466qta.26.1701984182003;
        Thu, 07 Dec 2023 13:23:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa4:b0:41b:5e46:aa61 with SMTP id
 s36-20020a05622a1aa400b0041b5e46aa61ls619494qtc.1.-pod-prod-02-us; Thu, 07
 Dec 2023 13:23:01 -0800 (PST)
X-Received: by 2002:a05:620a:2702:b0:77e:fba3:58e4 with SMTP id b2-20020a05620a270200b0077efba358e4mr1880081qkp.117.1701984181478;
        Thu, 07 Dec 2023 13:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984181; cv=none;
        d=google.com; s=arc-20160816;
        b=CYhyn+H1H4MSdR+BS8MvlXOREuPTYDCg6OFvNubLwvTnOcWn6V/t1MJ9qKHio76V3F
         7qindBdtMp97I1CGN96yMC0wsm459QhNhJbgh+NW7JP8RTsQy2eOurdFNYvyD7ClDIGU
         O6SRua8ZsZarJc9kuSgyM2eYSLIuVMV6qxaHE5U2cIhKwZ9SsbyZ0dpAlJb19D5ZoVcs
         imE2thfv9f6HM/Y30JnmHTSwwip8btuV4Rgfc5ijdksrPTnicTfwPxfAkX1QaAz1x7li
         zWG1QY/WQ+LYX4pTgIHXFfCfQXhjaaLVgduiS1qEN624hKTDHQt1gij2IwmqteyX8gz+
         rRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=8LJStTcEUC8o0lLNAVpCzprXOnufVOzk9OY/aFWfrk0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=k5BSdEMr7eTUDr6/9tm+WYwkLfMr9wv2FEwqejA/BMX0k6N1Ht34UMyo9ViNUULyJK
         785z7ws/DselWkXTvzpQ/3VAR44uFkc1odFwOjdbAm3e7PSM/0OpjH+8NzeaFtewmWX3
         28JVa8MFO71RRpWBPo1AOO2wjf0jNglPpqNM+zlgkrijycZn4hyKnK0N0fHHgZiuLErt
         JnlY4n2i9XoIPZbJMZZ5IXo/+13s+VSc0N4jEbs2d2XlSenilRL8PL8xzmjNMC+S9OKb
         WKItTzOKaejjsIsFcU/TIUfMqdtrkAa3Dg4XPYq1X0SAbPFrbfqmqZ0NyHwG0qOMii1X
         S57w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id dv8-20020a05620a1b8800b0077f10000f92si590094qkb.694.2023.12.07.13.23.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:01 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-PvxIugK7NsmVLX4kaP_TiA-1; Thu, 07 Dec 2023 16:22:59 -0500
X-MC-Unique: PvxIugK7NsmVLX4kaP_TiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A4388489AC
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 169C0C185A5; Thu,  7 Dec 2023 21:22:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4A1C185A0;
	Thu,  7 Dec 2023 21:22:56 +0000 (UTC)
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
Subject: [PATCH v3 14/59] netfs: Provide tools to create a buffer in an xarray
Date: Thu,  7 Dec 2023 21:21:21 +0000
Message-ID: <20231207212206.1379128-15-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
index 2bd99989dd7f..1f25e8622b8a 100644
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

