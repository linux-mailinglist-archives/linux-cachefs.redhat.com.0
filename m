Return-Path: <linux-cachefs+bncBCXIHK4S6EJRB4W3SOWQMGQE7GCEVSY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F182D519
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 Jan 2024 09:33:57 +0100 (CET)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5f8ffd9fb8asf109730477b3.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 15 Jan 2024 00:33:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705307636; cv=pass;
        d=google.com; s=arc-20160816;
        b=FW/ujlH7wyAyaoFh+OruirKVJ/VX57agTGHEneV0LvPH7vOg93hS8UWlGuj3gU29wr
         ksEyS2dSA2Iykwj9LE1rmfklEKVQXak+tw2AyMLbJtt06sD3NqUaTlxtv1ilXmlNgsM2
         sebhE+X4NIpQ67p8YonScfBx7ItPCSX/2cwOCmYhtwPedgJw7MOghISD8JYE94II9JEa
         jYR/cOfYNa1rI1lv8XdlbO68qvW/mh/dpazU05KSXyOsaTT4Wj5btTFQxSB5nGN9KqyD
         KWKcqSvrdHqYlVg+5bXDfFXAdWuTGEzDIstQnCKcMTMH4lfSQas4ebMoTxYZ2Qt0Rbtk
         opwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=UTGJugVIUO2EHZo2IpwjrZdfGF0eO5929lsfpQ5ZwXE=;
        fh=o2uHjugiPjB58XdARDWJKl3FTaqNvXZ1kJ/rwPVuIMM=;
        b=R7R/3RCDr5nLlLuh9FFXmvCRpLI58bVaGL8rAcpokjSw23K+NVTMFWJGnRBwAx7Miq
         RUXuRuHv+yfacAiy60vDVjmfC/53n7agB3Atwyz+BdZdJ5ej8BdIhUGP7MWr7WdoTUif
         uE448MoVuJnHiNcEcWPWESY/VabW2anqDEpm68WnM8dRdVDPKmApBHYu2xxVKJRItf9M
         zBEzmyPs7iICUtmyYYkWY3hyqIkZ35mzIpuQYb3q36QGhhA5rNpGcVligmalnsZPFLJW
         1ykxeAOnOWPNBZXKWxrx27fBODbd2Qj+eH+p4P5LqZ/mSabUQBXP9jqmasKe6ls4CWDQ
         qKsg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.110 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705307636; x=1705912436;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UTGJugVIUO2EHZo2IpwjrZdfGF0eO5929lsfpQ5ZwXE=;
        b=OxLCqMlQi0XtlC0z71t6edVGo3K1vuVdGgluRIKnCcYRISxJB3H0Q25kDln8bCO1WT
         vZlp01eo6J5FZ38UZHNOLpN29uZ8kx7LGjro9/7zr6WD3DeeksmI82sWHa1CCj82i3r3
         vBbZ3Y33LmUosVf56bf+hrq0e+qfw9U5hwM9GxFCQcZxg4UjKJZHG61Dzs9uGjZ4Me+i
         dXQcAkhEjdLBcAy0u0KEU//dOXUOTOJEAnA/9lgRgTPrytb+NEdkg1pCIgVIVAqE0/0v
         5cNBivsnMTKAg3m6NoVfN8rRQ06+xcMnaRPHGCs5t7sQobNBWar6QNhwytfmMs0veWC5
         XJCQ==
X-Gm-Message-State: AOJu0YyiLZlVFt0/9v2GTF+JFUjEqAlwTTylIv4mHMiz7cDQ88ixhl/u
	+Zytw7Zft0iLoTczv2e8FHo5jLjbl3YgtQ==
X-Google-Smtp-Source: AGHT+IGVNkmIZZtXE2eLU044IvJy/66wCRqp7x/O8ekDWKqYBcyiLfEHV6t78HYvhiM+H6OHXwK9XA==
X-Received: by 2002:a0d:ca13:0:b0:5ee:d57e:ee04 with SMTP id m19-20020a0dca13000000b005eed57eee04mr3571722ywd.21.1705307634899;
        Mon, 15 Jan 2024 00:33:54 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:b3d4:0:b0:67a:203f:dbc7 with SMTP id b20-20020a0cb3d4000000b0067a203fdbc7ls457989qvf.1.-pod-prod-06-us;
 Mon, 15 Jan 2024 00:33:54 -0800 (PST)
X-Received: by 2002:a05:620a:b11:b0:783:289b:bb99 with SMTP id t17-20020a05620a0b1100b00783289bbb99mr6035448qkg.109.1705307634073;
        Mon, 15 Jan 2024 00:33:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705307634; cv=none;
        d=google.com; s=arc-20160816;
        b=AYCAZsoS0ircIrtpSyQp6xy8WuAbOQjh77nLDeIYhT565C1BGNHl7vwEqIyX9vSmiQ
         VTWTSEBxl7bzSRyatIkqD40T2TrL9sIV3ra2LMhJVVtdsU8/LkIZusSf16A7f26b4un0
         uRuU7Fkft8mNqsLz17dehmDJqGQpQB8dgGbcz/R61TFm3DR63jZo1R0ATxBiOAA5EsXX
         R/j0FwmrY5fw8Nc3/P2u21Jh3ZQONfQcSveA9xeyz/tsD/VP82Tp2Gyjl+tua42W6asW
         S7HIN+1DvNKpOtMsIDNQcJK+QdHm7A/XB9DJWmwUccm+LxYH/2RelQ1KK1nqXOSrTir4
         dXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=/y/yzL8tML/pf3ry6uK+QziwiYPOWOXTZCXt4B4L3BQ=;
        fh=o2uHjugiPjB58XdARDWJKl3FTaqNvXZ1kJ/rwPVuIMM=;
        b=cYV1qSqcJLUHjIp7AIM4YoGObx287NHCxuSg4JMSSvyvulFaxkAezeeXdeANeFjnqG
         ABdpFl3adlm2ar8mIAsNJo8jEuBGe9jE9rVxO/P1fsX8DRdo6HR87s0ij/vBq/X6I6Mt
         7kDQk7z+8BkJTnL1ckJoyhCqTMifkbf57Ki6c4ZN+RIM6wiYH68wXs1dokoSgFLJ6aOl
         2KFKmryWV1GZNPxepPLFAuK0a9LgTO4/wqKrnH+k6xde9A4pT9RHApBSK/0J8R5ublxM
         uGoUKhCPeXF6oc2sJKIUsiZS4E2xmr1VF2aLE9meCyRn59AFM3/mbFjpkb1UAnbE3PZE
         P/PA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.110 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id w16-20020a05620a095000b00783222ee668si7261829qkw.567.2024.01.15.00.33.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 00:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.110 as permitted sender) client-ip=115.124.30.110;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-do9w9CyZPIS9t-355ZYQqQ-1; Mon,
 15 Jan 2024 03:33:52 -0500
X-MC-Unique: do9w9CyZPIS9t-355ZYQqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCCAE1C04B53
	for <linux-cachefs@gapps.redhat.com>; Mon, 15 Jan 2024 08:33:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B9C221C05E1A; Mon, 15 Jan 2024 08:33:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2BE31C060B3
	for <linux-cachefs@redhat.com>; Mon, 15 Jan 2024 08:33:51 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9176010259E6
	for <linux-cachefs@redhat.com>; Mon, 15 Jan 2024 08:33:51 +0000 (UTC)
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-214-TcsKPmP1PziBog6VKbiJqw-1; Mon, 15 Jan 2024 03:33:48 -0500
X-MC-Unique: TcsKPmP1PziBog6VKbiJqw-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0W-eUMPj_1705307618
Received: from e69b19392.et15sqa.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0W-eUMPj_1705307618)
          by smtp.aliyun-inc.com;
          Mon, 15 Jan 2024 16:33:44 +0800
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
Date: Mon, 15 Jan 2024 16:33:37 +0800
Message-Id: <20240115083337.1355191-1-hsiangkao@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.110 as permitted
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

