Return-Path: <linux-cachefs+bncBDLIXLMFVAERBH6Y6SWAMGQEDJRRETQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D978284B5
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 12:21:04 +0100 (CET)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-dbce2a8d700sf2824901276.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 03:21:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704799263; cv=pass;
        d=google.com; s=arc-20160816;
        b=B6sU/+GqsipgmEXZxoClF0Khzgz3ygCLvnxjlxIYK/JGjQdXNKT3yqoydQWFrHSArE
         nmAYuW45MiRh8y2Q5wDfEvm6dp2GbyHaFsjtFllEkQWPMBDqGIZtoRi0kJ3wqmrhmfbc
         8jkOs5Av0YIUFYXaLV9UhVkj2S847UHU7kI3TvWBddKHSyuvxAu9G8VOwh4vnVtFnOS8
         urfxY3qSonIy1chh7ZcKZYonjTZQLuskUv/twHl3t3NUqFx1LhbERBWp4bmGiaYW5Rr8
         HWzP+8/c9bXnI76Tc22CpUee5HXazxbNQ7WMg9B9asWuIzDtosCAqV6wMFJjRNSjDex3
         KehQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5j41amsW5+D2ohy5dOlBFjqnhyN7tT3f7CI3UQRBwZ8=;
        fh=C4wT4o+0O6e8YiKCOcA8IWo9Yd3506P35P9sYXQJeL0=;
        b=MP3EAcGbOPdF2MBZKQ0nrWMz50Ep/5fI0DEooG5RYa+t0HnFAKgl8mVC/MM/mzXXix
         mB5o1qlnBAI2I4Gx9H1jwUybBQWdreipmKaTHYpS11E/LJNXPi+B8z7OwU2XyLqu/Zk2
         1l6Sd/dsXjTkb7kF2k+DOI4ubLVV8ztv7NHH6lj7xVx+8OVvq3hoQIi5IdaYuKMWBbi6
         523nz8WUZd6QSzygUPJUM1T3Va3PWV4WX+m55PRR3DYd961YcGPkI+ZkDPAlLrs57QT+
         WcGAg5W2eiVn8H/tfb/IRyNNhZATaXCVH+TNcek8NfskDWIJ8iTnS6ndEIMpKMV2VDzC
         X6SQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799263; x=1705404063;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j41amsW5+D2ohy5dOlBFjqnhyN7tT3f7CI3UQRBwZ8=;
        b=b5b8sWv2gduj/hfQZy33ZQLSHWxv/LkUE8fxAWifS7eHI2+F8Fy+c0jxekAUEbr+XM
         Stm0Kg2p7kuS9QNrzI8CO34VOngsjV4QvGgK/3CT0ewf4Su6NMWw3RW7M0p5DFeQ2SMK
         2PTUk301vGO+tlZ5CaeQ/TV6EP7Wj0Gx+gHjeecW7vD7pTDgWcJtzyKtqQgZlYqh3SaI
         /H8pdQdYTiceJ2jWutvxhFoFWwyyX34Q5tthAo5WbtcV/CR1rz2luM/zLADmIuif7AdR
         X7E79G/YuSX+UsnyFcyjEuusPQd9zDP01/dZh/XPidd5m0BPf1i+jxn+wDeG+SU0NQ9s
         y/lQ==
X-Gm-Message-State: AOJu0YxNNCOK4KcAmy/kj2ofDJkuXL7I5PRhKgclJY7ZH2S/lOXMzXm7
	S4gWUpLs34C7hRX2js6VTd04ROoesg1tlg==
X-Google-Smtp-Source: AGHT+IH43OM15pOEdUy6uDaZY4bMU5fGDYhtMroI3F1BrMRNP46uhNQ2m+O53NhOtLe/gEcKZNngcA==
X-Received: by 2002:a25:a488:0:b0:dbe:aa3a:9779 with SMTP id g8-20020a25a488000000b00dbeaa3a9779mr2557353ybi.16.1704799263437;
        Tue, 09 Jan 2024 03:21:03 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:7497:0:b0:dbe:324e:991a with SMTP id p145-20020a257497000000b00dbe324e991als963970ybc.2.-pod-prod-04-us;
 Tue, 09 Jan 2024 03:21:03 -0800 (PST)
X-Received: by 2002:a81:71c3:0:b0:5f0:eb4e:57e7 with SMTP id m186-20020a8171c3000000b005f0eb4e57e7mr4083875ywc.12.1704799262885;
        Tue, 09 Jan 2024 03:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704799262; cv=none;
        d=google.com; s=arc-20160816;
        b=QjJ5dhID52FeweaJTJBLvzk8/NX9qzt1tev22XoAJiJ+1MwJh48TPTzfoazMaSX50r
         BAwf4ztRgM+YQJVHkIv1BJUKm4nlhKWUIiblOw+fHt+49vYS+aU+OxqlHckk9pUouYZs
         eqFauaKI8AkR2vkfB/hj14qXADpZYzWT3MlSXDciMMUSIGJ5WZ2Rzm8md3ECKKIV1Dlo
         M8FWQsBkV/ggTip9+3UC4t2cNMrfbfyn4ud7uBOb9SJ3q1aZCgm4ot1yCHJXjYJx8mbw
         DFue5x05qj/5P32XYLw2LZVf8sD9YrN+vU5jPU1S7QyI4pge3D73Cr2svxjjgF0AMsyV
         +hyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lTmcWwAowP4sGHH2dBxkB2CC/aMCkpFsy2ZSyWuDsbM=;
        fh=C4wT4o+0O6e8YiKCOcA8IWo9Yd3506P35P9sYXQJeL0=;
        b=sgfxcLjRm4m/J9u+5XCUD+3yFxjRs7ClaRVLGL031sbCw/G+kSJjmncCZLQv4ByBop
         EamenMjWSECASd67NADmC2i8pFCfGIuqbO0tRXkCGTDO3nudvtPUaOxyvjTMRjst0sDh
         it0zvQVQvkw00skoLlUN+mxWsiCOMsnzgJFui0JsYNKk6nLffkLb6iYkpFTJbVSTKj7V
         LZW62Q6a+YRIPV8kR9ozV5foGkNvVqciLYvVjZrBlNLiHe87g0UcaiawEm0DN0F9IqZr
         pKUgfnoaL5YrzwisitcAt7OQ8qc5pcVxxzhHJS3ovBSZbyKAllT2lEWJE04tTe+MfI5i
         V4Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id n9-20020a81bd49000000b005f5a9eb2bfcsi660467ywk.395.2024.01.09.03.21.02
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-hlo66mEyOLqVrPfXvgnb0Q-1; Tue, 09 Jan 2024 06:21:01 -0500
X-MC-Unique: hlo66mEyOLqVrPfXvgnb0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E322F82A6C0
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 11:21:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DFD03C15E6A; Tue,  9 Jan 2024 11:21:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0990C15E6C;
	Tue,  9 Jan 2024 11:20:57 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
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
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 6/6] netfs: Fix wrong #ifdef hiding wait
Date: Tue,  9 Jan 2024 11:20:23 +0000
Message-ID: <20240109112029.1572463-7-dhowells@redhat.com>
In-Reply-To: <20240109112029.1572463-1-dhowells@redhat.com>
References: <20240109112029.1572463-1-dhowells@redhat.com>
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

netfs_writepages_begin() has the wait on the fscache folio conditional on
CONFIG_NETFS_FSCACHE - which doesn't exist.

Fix it to be conditional on CONFIG_FSCACHE instead.

Fixes: 62c3b7481b9a ("netfs: Provide a writepages implementation")
Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
Link: https://lore.kernel.org/r/20240109083257.GK132648@kernel.org/
---
 fs/netfs/buffered_write.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 0b2b7a60dabc..de517ca70d91 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1076,7 +1076,7 @@ static ssize_t netfs_writepages_begin(struct address_space *mapping,
 		folio_unlock(folio);
 		if (wbc->sync_mode != WB_SYNC_NONE) {
 			folio_wait_writeback(folio);
-#ifdef CONFIG_NETFS_FSCACHE
+#ifdef CONFIG_FSCACHE
 			folio_wait_fscache(folio);
 #endif
 			goto lock_again;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

