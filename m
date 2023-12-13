Return-Path: <linux-cachefs+bncBDLIXLMFVAERBAM246VQMGQEZUM6JKA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C0E811665
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:54 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4257662f905sf90868071cf.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481153; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xejgl4m1NUwM1k6AhbKPEovmzMW+Tl+mTCrE77ade3jI17KGtROFo+qkTNh8Fq+Iye
         Bxeql4/V23kkOAhVeAA1O1X34FhaKhgTdpPrf20h31+5FK7ToIwv87fAGCRvnjXuqNhK
         X1Mq8TCsrh6O8R6c507+z4rnhxBBCBcHY45ZgVLtQ1Q/sbpHYCj8ONyjuaDSBkJmHpXU
         VCjsBrDE8u4CV5oAkv5GMQZOYgJLcfIbXeuxxfhOEcJv58NyToqCqSpBPICbGmBwuHAS
         O83CJfaJ6S04XZLrcdQSDOskp/ocBxDUKaHachjyrZMxOReERvUBkevbOuzzXEiEQQPb
         2EXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=8Gi9R+0itA1BGMVWD9YmwysUI59ZR9hgwNcOahEPBPI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=DTRB9IDOftJk6SXZNJgiuOYqgi4ByzBgQ/qca27tlYpj2oDJWHwua1d34tyK/+M65u
         D6oo/wCmoI/OYuGky6gmBianGTGRcs+hPrmkrtt5C4OoJ4DI/xAt9ZCUPomelTBWBdRy
         lFmGZIdbZ7GvouGo40xDMZVWs9VJMYXL2r4rlT7hswu+pvZYoUVb+HlFhEBcA5vOXmSX
         QOEsiwRH3GjXhjHbAwfIDnpfp4GBmmnZn8Ky9EKk42tRtj+tNO3zVytdW0h2aX9TSJFk
         3DSvuraEYXIq6tvplF/EHkMgR7JG7b5iM3DapEV1r+dia9RF4JF6tSYKuIYTxAHQuFpr
         fVFQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481153; x=1703085953;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Gi9R+0itA1BGMVWD9YmwysUI59ZR9hgwNcOahEPBPI=;
        b=pgW82+TbWaDq4SmY+DYR600UuUbCv0tafq1buM1NlBEwrh7XCM/EDPWJ2dz9TqFBav
         zuk9IyvRHoB2BRp8L8GBMT2kGgwuQAoXQkNf3LuTqRIULedGZNqAnPibdEfMI/ZdoYgW
         JBTSc7HJKQcSlv53q65g3G7EFBfp/4SLAUb8k2cSgV4B/ZAuCShtIkDUrgnqIAU1R6rx
         8RDdH3pd/s28/11y4Cz44P26n8ipnJLiSUfh+ab9tJTyOYwFkQz3fHrohGnLcraBVVXB
         S9D5oVzN30e22e9m9pr7Z5JcQg1Ph3peQ864EkRF+7LSBfYYUyMJsiB0WujtAxAKm2rl
         AzrA==
X-Gm-Message-State: AOJu0YzuQGZcEZeeTx1V3QIJMmoAhOnvgzraoz5wUbwWAoDy3p/lnwaA
	LP711cfCoaiqtx4zr25svlSQWQ==
X-Google-Smtp-Source: AGHT+IFjKllOD2C+6+To4hl2XsdfgLJ1uQyU1A+zkwosa4n+ZrgENBVAtXioc0dEBdXsOMaHeQ5NSA==
X-Received: by 2002:ac8:584a:0:b0:425:7ea5:4602 with SMTP id h10-20020ac8584a000000b004257ea54602mr12529042qth.85.1702481153670;
        Wed, 13 Dec 2023 07:25:53 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:19a2:b0:423:7c51:c731 with SMTP id
 u34-20020a05622a19a200b004237c51c731ls621826qtc.2.-pod-prod-05-us; Wed, 13
 Dec 2023 07:25:53 -0800 (PST)
X-Received: by 2002:ac8:7d92:0:b0:425:4043:50b6 with SMTP id c18-20020ac87d92000000b00425404350b6mr11748628qtd.69.1702481153168;
        Wed, 13 Dec 2023 07:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481153; cv=none;
        d=google.com; s=arc-20160816;
        b=tExBuhgSdviVHh8DWJoIP+hfZx0WCrZ+EEmZHUfs/bzHHLg/41vXjNbdJ0lEwt5vbf
         5Mlm7Z/EcoRhyew1r4sBGEOkguFoJzXEDJas6H+g209KCOaeIxkCtlDhK6xKfaTXiLNQ
         lHYWaP+Su/AxsZxuaHqUiYSpTmLx/NBAoDqzsC9x45FBByI4NcqhlXiwQhVxMmOtei+u
         suYyA5W+ZzOE67UCA2/XNNfL4CkT/JAe1zet1EjaoiLuyiYKRoPiHsrzkFWwxnEULsoG
         kO5J7kbztm73dredKSpjwRT2BCeoCQu8peaWHU0xnCbM2ZJkn8Yo+fTHOjdgEcqJjHtb
         /2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=KbBg4oLyg/4VjucqWLPnAUrUGVI7xibirsiFMNrNygw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=VU+ZLZZAUl9qOSgok/d1J/YKRmDeV6SyFTW2wbZxp0eXKxHieN7SkGcD6K9kW9hVXp
         TI+NWnz7mxDdxPqAQfKg7vgmX+YTFu3RGuchVdvhG8BHumWsYE+HNEuj4a+AYFUUSybL
         L72lgMEfGUXA8VjwdqWxhdKhcBFTQr49JUsW7hbfvtYLKTzOgsv7YaoYBoGLoRk2pASN
         8VyOZwAGw58jm3dS0X48LX+1sWvJqyuLyFXatixP9I9xbvwX0i8aAgDs/SWx6zCGnnF2
         IwilAuaOlLeIuYWAxRMZ+qYgDoJGf5wYFZ0YHi7a5+aQcEJjslhwK8f/qpdHNU5wVAGh
         A3tA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id hb11-20020a05622a2b4b00b004254900d0fbsi14283155qtb.451.2023.12.13.07.25.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:53 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-n1FUS4XNPUCVBDFg1uI9XQ-1; Wed, 13 Dec 2023 10:25:50 -0500
X-MC-Unique: n1FUS4XNPUCVBDFg1uI9XQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EDB3881F4E
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7BD1A5191; Wed, 13 Dec 2023 15:25:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD51451E3;
	Wed, 13 Dec 2023 15:25:46 +0000 (UTC)
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
Subject: [PATCH v4 27/39] netfs: Allocate multipage folios in the writepath
Date: Wed, 13 Dec 2023 15:23:37 +0000
Message-ID: <20231213152350.431591-28-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Allocate a multipage folio when copying data into the pagecache if possible
if there's sufficient data to warrant it.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 6e7f06d9962d..b76688e98f81 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -84,14 +84,19 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 }
 
 /*
- * Grab a folio for writing and lock it.
+ * Grab a folio for writing and lock it.  Attempt to allocate as large a folio
+ * as possible to hold as much of the remaining length as possible in one go.
  */
 static struct folio *netfs_grab_folio_for_write(struct address_space *mapping,
 						loff_t pos, size_t part)
 {
 	pgoff_t index = pos / PAGE_SIZE;
+	fgf_t fgp_flags = FGP_WRITEBEGIN;
 
-	return __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
+	if (mapping_large_folio_support(mapping))
+		fgp_flags |= fgf_set_order(pos % PAGE_SIZE + part);
+
+	return __filemap_get_folio(mapping, index, fgp_flags,
 				   mapping_gfp_mask(mapping));
 }
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

