Return-Path: <linux-cachefs+bncBDLIXLMFVAERBA4U62WAMGQEBD7YUPQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D23828BB3
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 19:01:40 +0100 (CET)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5f7942a16c3sf39679347b3.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 10:01:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704823299; cv=pass;
        d=google.com; s=arc-20160816;
        b=OTNmB+zEURaGKdwF8r8HksIb1Kug98kHaSjM7xLL0SB4el37ndJIgWrtmbnMIF6N56
         Tx/Hi6bPurOFmw/M1sE0+NZPOepkT4mmcyJVDlyP59jJYf7d+BkIpm4thmP/W+F02jqc
         UYyzpbcBdJagg813IHT1okQ6aawPynixGUKgv6SvhYYtRjNGqKup5mRTqAkSGK176i/B
         tLRnO7LeFkfBfR8mJXGVZJibZfMNO2brhisQlaxHhMGc6MldpiDvo2n/vDWlEA2KfgjO
         YEYgSL1EbFmT4AqKhxFNTh4gilvgNU139mPPoBOEY5A0QL+EUNL/geyPfXEW5ievf7tN
         drww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=PWQ2RM9kWZqNID9AxQ45JESMKqmEGDRdkMmr3XbhCI0=;
        fh=7XFl5BWf++B7gqC2nwdA1vswDuQtYm8daAuHT226Q+A=;
        b=gaea3ukoW9rSkj+fYzUKgjXLougZxA2i/I5hCvjBDAQ6OK0jdSvQAeS2znF9/BLVUH
         AGB8wVNjQyXle7a+j4Xai5uPPhpk4qU5s1H+z6UZyWjwZiDMowyP2kcTGUiitq8dIOvu
         fdVdJOWuWCj5W5S2ZAc38RmOGC3jjmANfp1d56nHJsUjFXFZZf9cSf4lBY5jSPPV1wtD
         kDISU3nPSO7XPNV25xt6gE6dK8N7+0WbgJvvDT/UxNTxlcA+lkFxtL/Cuq94Au3htg/5
         WOBuM6byH+xIm3L3hNwh2XS2mbuw4cVbHjoT0HVfxOwBaFIbe0PZYg8G1wJRg/uq35vo
         U7Mw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823299; x=1705428099;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWQ2RM9kWZqNID9AxQ45JESMKqmEGDRdkMmr3XbhCI0=;
        b=cjxfzdKkuDErL+OH7iFhowSuI7bn7TL+8BPTxDsX2zwyvWYvjfjsgNphUm/XAHj3LP
         JHrx9eNyVQWc+1C8z4MieOtCmbVhJzO5UsNgOFGWVT7RsaFvqFzq3+Gb5iBBU/qnEiAb
         vDQmpdm1qlHDUkKIEM59qOYsgiUEnKWZzlfDPG1n1U9FpB8LcFZSB11jaqK+mya6JoEG
         xPQQC7i+fUUlGYy4vnjIfwX5pc2O0hzMM+JQjC9IlPLa1bZ0E81RFEZ5XOxS0VGMMfI6
         Iyg+m1wcOfEHZPUDXlZA4btyHFK8+UZKfz7au3+TJbNaul1hBzma9yIYOJ+YEzt/M29X
         yVYQ==
X-Gm-Message-State: AOJu0YzyaXwNS+P0MH0cOOyYYMlVyVbokuaFGJQ1P0/M0T7qGdBDZWCs
	tYY2e2lHC11e8TlUTs57vY4Zfwl2PB05IA==
X-Google-Smtp-Source: AGHT+IH48/v6DPnP1JHFQEvyv0hpOUMVVk2pvyMKtaReoSDLT1IbOKsFBrct9A0K8ZEuJDnhbh+eDA==
X-Received: by 2002:a25:5f44:0:b0:dbe:a335:1dad with SMTP id h4-20020a255f44000000b00dbea3351dadmr3387501ybm.57.1704823299549;
        Tue, 09 Jan 2024 10:01:39 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:d0ce:0:b0:dbe:9c83:a084 with SMTP id h197-20020a25d0ce000000b00dbe9c83a084ls1613346ybg.1.-pod-prod-04-us;
 Tue, 09 Jan 2024 10:01:39 -0800 (PST)
X-Received: by 2002:a25:ac8f:0:b0:d9a:e397:3b4 with SMTP id x15-20020a25ac8f000000b00d9ae39703b4mr3289145ybi.46.1704823298914;
        Tue, 09 Jan 2024 10:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823298; cv=none;
        d=google.com; s=arc-20160816;
        b=G9d7ulf8piBVbpfSJI7BBe4WwsNDiefR8hT1DDMrag/zoI1VHgKpYOG6xgWugmBvND
         B0XEMowkBp2IspUVV0QBjOH+DdByTOfJhVxLR/yYVaTTlqRyin0IwUWnIC3bdl84xcl0
         Oq3SvcFf+csmSermmjq151y4INMbPyVb8ejK2ZnDTCTU7H5DukZje7LhjFeq4I8W/aip
         ox2RCNQI9vdoFQPR3HBY9oQ4GdLQ41byzLKxtus01DPt048010qqL/OxcXFngoUYHkxs
         qo8lIbYAweg99c1OuhDlyU0hqsJY+pc8Ohlqc47zBGoPodd18uyK8T5Lif5r2mVcsB9w
         552w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7Xf1sEICUh1u9jN2O9W9Y+tFVYV24JiIia24sIupeow=;
        fh=7XFl5BWf++B7gqC2nwdA1vswDuQtYm8daAuHT226Q+A=;
        b=nx32awRKvhLNV0oBAaCIqSN/1lPAtaFRMYptT+Dl/zYXZfhcCXHpz2wntv51CPAC3g
         gKaQRgKgxNaKkgElor1NiISHTwNHqszrjPgAbZBm0mZdvJGjtn+0jNMtcfiqBUjAM2Ng
         mWaoWG/pAltXdzc41H7k0bKwgavK+KtmCIM0GxM8H+CTGnkVmPqwQJUnyPHCst88Fpbc
         nbFDT353n408WHaqgVaocb3XXFQZQr6ry0ZrJ/tTMltanxoLlSAv+3i3D8p/fWLLG19u
         A1pl0hVPquJYdvTtEsMeTV7UMV7XRA+ZOKRITLS8032Ohg0NmUpmaVAuzAheBFuHctSp
         zj7g==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g24-20020a67fd58000000b00466f3e6eef2si390916vsr.417.2024.01.09.10.01.38
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:01:38 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-1klW8jQ_NOWGbxmKgoC4yA-1; Tue, 09 Jan 2024 13:01:37 -0500
X-MC-Unique: 1klW8jQ_NOWGbxmKgoC4yA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09B2785A589
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 18:01:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 067EB2949; Tue,  9 Jan 2024 18:01:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C42D5012;
	Tue,  9 Jan 2024 18:01:33 +0000 (UTC)
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
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: [PATCH 3/4] erofs: Don't use certain internal folio_*() functions
Date: Tue,  9 Jan 2024 18:01:14 +0000
Message-ID: <20240109180117.1669008-4-dhowells@redhat.com>
In-Reply-To: <20240109180117.1669008-1-dhowells@redhat.com>
References: <20240109180117.1669008-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Filesystems should not be using folio->index not folio_index(folio) and
folio->mapping, not folio_mapping() or folio_file_mapping() in filesystem
code.

Change this automagically with:

perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/erofs/*.c

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Gao Xiang <xiang@kernel.org>
cc: Chao Yu <chao@kernel.org>
cc: Yue Hu <huyue2@coolpad.com>
cc: Jeffle Xu <jefflexu@linux.alibaba.com>
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
---
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
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

