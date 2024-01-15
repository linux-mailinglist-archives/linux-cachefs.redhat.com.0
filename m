Return-Path: <linux-cachefs+bncBCXIHK4S6EJRBMO4SOWQMGQEEHBPRZA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mail.lfdr.de (Postfix) with ESMTPS id B088A82D51E
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 Jan 2024 09:34:58 +0100 (CET)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-dbeba57a668sf11885566276.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 15 Jan 2024 00:34:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705307697; cv=pass;
        d=google.com; s=arc-20160816;
        b=FLio9OlmtuSetkSFsy0L3mWY9rpL4RgzmX6NskBKn85fL9ScnENkGe0eOFZzd84NR6
         EYdovoSR2P9f3BN/pJIJ8aVsHGoh7nxyLKUeGs35D0d68OFAoPhAKnpeWOr7nzVbj6ED
         rJBXozQ79xq7K4DzUtgKrX2wP/HDMf5YpWEbqdWlLmym4IfLIVGgZywOk+qZ/Lu128V3
         vhujI86Bd8WcHcn5WBXUxCC3b+wMl36DxK6tF+E4z0d7qdS4PsU29oKhnnfAA9Vabk78
         nHGO5mI/0OHZIG3Osx0IMRTLum8lIu8kJxb2VA+KqwgBFJ+SqrVkaWf69eEuVeVUy+0u
         EGxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=UTGJugVIUO2EHZo2IpwjrZdfGF0eO5929lsfpQ5ZwXE=;
        fh=o2uHjugiPjB58XdARDWJKl3FTaqNvXZ1kJ/rwPVuIMM=;
        b=ddNCrLFcwY63jUA6ae2qj8POg6YT4amd9IWx3jykShv98gLnhq+APr9qZWOjNIkxpn
         KCLwZwwftCPZBuHUKynX+LZo22Bo9Qv4TmUVxWy4Pwl1C2jR+R3e1+d+6lVws6mWP47r
         OmRA+qZ3L+IXSaH178T0pHAtmJobdgUUj5I87j8E4uJpxwzPus5MbOxPoTlo+O12BEJV
         fKfL5/Ewv4syIERFYY2AV4RvTUsRGRZeW+ogx+kOu54nDLp/183A5f7O28KBvyFvn0wS
         x1qJNLWhQMa5R7owaaKnaji6KxCrnb9twJprIyTXCwqJ/3ufVx6BK2QnKv5eSc+Wcap6
         IWkQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.113 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705307697; x=1705912497;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTGJugVIUO2EHZo2IpwjrZdfGF0eO5929lsfpQ5ZwXE=;
        b=wZwfpHlSjEUFsEfKbkukEYPnbdHegNBN3Z8M5YOhsG3lfwLhehb/TBlSARkkUPBkaP
         v3QKtCMzQE9ACwA/oXIqpkRAk33xOYo+e46l5Kyr7zHxbKPQH0ebAK70gcIptm+bowRl
         ND0k/xaSbBPFWjdb+uom6Z0BRe1UOOjI/ktKRqvXzBX9K84FH2HNiAyNGlGbrsQYNRQP
         TQczVJ6LOJjEmY7usW1CmxXiXqeeRTgG4iBtieepUBtjpzw0R7DXLKmQQ7Mhqi4PulSx
         JIOgr1s7qPwDyOkaeGFIL8L9QlZMGwnguA4s5oC6jA2WE43xU0Q43JgWAZl/zScGpdZT
         olcA==
X-Gm-Message-State: AOJu0YyWIRBaS067c3VrBNhfYz5FihUOcjPZA0eQ22O+pkDdC1+CqmBP
	+dxTJfQI38eYwXR/VyOm5PC1TLfJCLH8pg==
X-Google-Smtp-Source: AGHT+IEieg/91zvWvhcMOznZV5FouvQXAuGD/SMdTEXfmOaBhiVauJw6x4CwZuW2r2Y7RgdboltyHw==
X-Received: by 2002:a5b:10:0:b0:dbd:b0a9:b16b with SMTP id a16-20020a5b0010000000b00dbdb0a9b16bmr1978914ybp.17.1705307697667;
        Mon, 15 Jan 2024 00:34:57 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1992:b0:429:b0ad:d841 with SMTP id
 u18-20020a05622a199200b00429b0add841ls3887458qtc.2.-pod-prod-09-us; Mon, 15
 Jan 2024 00:34:57 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:783:4c46:2ffa with SMTP id o18-20020a05620a2a1200b007834c462ffamr5837759qkp.142.1705307697040;
        Mon, 15 Jan 2024 00:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705307697; cv=none;
        d=google.com; s=arc-20160816;
        b=w/oEe3uTwQ+vUpOTfHu5guCIJZrXDInSNwMT7i+9+Y20VV8u5ITcvgxgTr3DP6qYeA
         +FjCOArZCytonbJAy4q3NCnwAC5cFX/aK2pN8i9zCZzYM9sctUAyAgH2tipVvi5s2Uyo
         UIBR4SccM15r0TNjdJmPEes92+tsjxHPvlKb4dWBbwpVCRJt4n32S7BusTNJGfv90ncG
         MGdtNvQifTXFPKa3Oh+6E0nFFQTStayxresfjy+AnXIZ81KcE53+WdgjZge1BEwg2pCP
         cg+ppNz+DhAmXGy7zOeSnOd7ozUYa2DnszJUu2zp9a2JiRS5iFi8TFQ8x2mhZPITE2pS
         p3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/y/yzL8tML/pf3ry6uK+QziwiYPOWOXTZCXt4B4L3BQ=;
        fh=o2uHjugiPjB58XdARDWJKl3FTaqNvXZ1kJ/rwPVuIMM=;
        b=S6r6dL8QkOFRNYXy0DZWhTLOBPhVYnPKy1xxX0w+W2GRTTqr06HCB4duaLC/G9W4jV
         EK0b/mhcFiIAtPF1nuchAWDcqMxuFro1H4ewnq44L/IwAEpcjFvO9topN5wK4wPFzsvD
         Ij5rqh0zCXdt2hR6bY1JJPPQpg66bD8acxrH/ax+pw9uyeXNU1N2X8W1HjNdVBTPYc1d
         /TIIZQguDOv0jCfpCfu64stY94Jhfsua0uVd4UbCLingsb/QDJJqFr5FuaJyyl+Hig5Z
         VLJVUlnU/f8mM1YdZLY96WsvbkOw0lnoo5dcYJpgoMYvBzEsb1IG3nlLoB9fhSG1k3N2
         4N8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.113 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id z33-20020a05620a262100b00783525411a0si3889146qko.504.2024.01.15.00.34.56
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 00:34:57 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.113 as permitted sender) client-ip=115.124.30.113;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-_sm7iIzENoeQZTqlAPLCUQ-1; Mon,
 15 Jan 2024 03:34:55 -0500
X-MC-Unique: _sm7iIzENoeQZTqlAPLCUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1E6F1C04B50
	for <linux-cachefs@gapps.redhat.com>; Mon, 15 Jan 2024 08:34:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id AEB48111E3EE; Mon, 15 Jan 2024 08:34:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C14112131D
	for <linux-cachefs@redhat.com>; Mon, 15 Jan 2024 08:34:55 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41FFD185A78A
	for <linux-cachefs@redhat.com>; Mon, 15 Jan 2024 08:34:55 +0000 (UTC)
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-457-oSRwcraBPaCfPUIem0Mzhw-1; Mon, 15 Jan 2024 03:34:51 -0500
X-MC-Unique: oSRwcraBPaCfPUIem0Mzhw-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R401e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0W-eSTCt_1705307687
Received: from e69b19392.et15sqa.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0W-eSTCt_1705307687)
          by smtp.aliyun-inc.com;
          Mon, 15 Jan 2024 16:34:48 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	David Howells <dhowells@redhat.com>,
	Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH v2 3/4] erofs: Don't use certain internal folio_*() functions
Date: Mon, 15 Jan 2024 16:34:45 +0800
Message-Id: <20240115083445.1356899-1-hsiangkao@linux.alibaba.com>
In-Reply-To: <20240109180117.1669008-4-dhowells@redhat.com>
References: <20240109180117.1669008-4-dhowells@redhat.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.113 as permitted
 sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
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

From: David Howells <dhowells@redhat.com>

Filesystems should use folio->index and folio->mapping, instead of
folio_index(folio), folio_mapping() and folio_file_mapping() since
they know that it's in the pagecache.

Change this automagically with:

perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/erofs/*.c

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: Yue Hu <huyue2@coolpad.com>
Cc: Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
Hi folks,

I tend to apply this patch upstream since compressed data fscache
adaption touches this part too.  If there is no objection, I'm
going to take this patch separately for -next shortly..

Thanks,
Gao Xiang

Change since v1:
 - a better commit message pointed out by Jeff Layton.

 fs/erofs/fscache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 87ff35bff8d5..bc12030393b2 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -165,10 +165,10 @@ static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
 static int erofs_fscache_meta_read_folio(struct file *data, struct folio *folio)
 {
 	int ret;
-	struct erofs_fscache *ctx = folio_mapping(folio)->host->i_private;
+	struct erofs_fscache *ctx = folio->mapping->host->i_private;
 	struct erofs_fscache_request *req;
 
-	req = erofs_fscache_req_alloc(folio_mapping(folio),
+	req = erofs_fscache_req_alloc(folio->mapping,
 				folio_pos(folio), folio_size(folio));
 	if (IS_ERR(req)) {
 		folio_unlock(folio);
@@ -276,7 +276,7 @@ static int erofs_fscache_read_folio(struct file *file, struct folio *folio)
 	struct erofs_fscache_request *req;
 	int ret;
 
-	req = erofs_fscache_req_alloc(folio_mapping(folio),
+	req = erofs_fscache_req_alloc(folio->mapping,
 			folio_pos(folio), folio_size(folio));
 	if (IS_ERR(req)) {
 		folio_unlock(folio);
-- 
2.39.3

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

