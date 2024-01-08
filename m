Return-Path: <linux-cachefs+bncBDLIXLMFVAERBE6Y6GWAMGQEBYWX2AI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id F167E827A4F
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Jan 2024 22:41:40 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-20407fffbfdsf901081fac.0
        for <lists+linux-cachefs@lfdr.de>; Mon, 08 Jan 2024 13:41:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704750099; cv=pass;
        d=google.com; s=arc-20160816;
        b=x1HjVKIECBx0kHq/CFi2nSj4ACWQATMnBgLJP8po7sLbFsRYbN4Et/sBravr5Hrf1l
         J4/hmmfdtm54czHANb1zHzZLugwgC2SYQnALivHN5BJo3tJ1KiFclC5jR7jlSukzCpOP
         IOIJwBA0Vvyf+Nalnv1cO/W5nugvm+HdvWzG9x6Mk9AOXS9V4bzaFnW9IB6qmJeJk6iV
         TxUIo4OAiHFqP6wPhrjy5eraR9I/qTfBaSCj7ZDuaCUSVHKazKbeLbutqwXOSMy10meF
         l4XH9/is5UdHKDz7+BocCsIQ8HT7C/gq/xnpL2Kn99SZpri2LW83kjlrr9nBmWvYc4Zl
         E6zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=zoIfs5QLGCOVbLhB0t6hG7kvS7+1XvpPb3TNF7JwvNY=;
        fh=t0h5rXJgHaPw+IxS2U3hbCvzGPWejKCfaHCY83fftFo=;
        b=G/yyobXr92QXNT7iVkL0TwhIViNZXUYNitijaapWkCXShKR7LQ3xzlsFOw4N0QiIMk
         bzOOB0BrsA/KPX4xNV/kt8OS4HdKtEWGHi99lggsNKpx4aXyuM+DxBIg0+FuiDt70Xof
         BCGQavSy22kMzaIWBYasZ7YT9kHfVoqlcOPbKTRPXQxP/wUJHUoCyxMDJ9ijKKBpSO07
         FtTcbvr/zdpYzsHEwMoIXNQ8X8mgAt3Dn+v01k80u60cynStqp+SIeoe/dpNwqXbGefF
         VVQ3AUbce4ZOeO/PpE5BBJ13c9hU2IESNLWSNbthUB6nju6VFHGyEOA/qUCWmVzPzmIz
         NY+g==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704750099; x=1705354899;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zoIfs5QLGCOVbLhB0t6hG7kvS7+1XvpPb3TNF7JwvNY=;
        b=d+OxMOd95nmvfw8GOsfPoLZ4ght82oxgk0ysUCH15YMrVLVJP8eC4KI0NoPQOJnKxy
         ltcR4YTgbP+AAexjTjpVTWynfiLt6m8Vz6TU54PTOLzKitnl6AG/3wMAkNeZ1gjvn9LJ
         /+VNKVw9RkyXS1qFcYgSinXWhaqAbMlt4bPKOVc8D8QX2vZbQ2gUJJyf0wS6E5qe62gT
         UGEEo9lxxyR4arSEO9qogODB/pSCVT5RUJiVW/bidWDmOGrSFMohkR3q2lcIxFzpUszz
         UxpPLFmL+qjpFcoecN3uG/x00bqCuGveVPV0bG1dE5Q18uNJt/8285cNkkWZgI9pbdDd
         KZrg==
X-Gm-Message-State: AOJu0YwrA/Ek1pNiJ5h0BoKx90jH11eNoOD+XSer3nJMucEpZ8UVGv9w
	ngvBfpk0xZ03AXv5Mxja6+5W9MWZAOzBpQ==
X-Google-Smtp-Source: AGHT+IEEgJYyd/KS/vsoH+Rz0EOUlwKTxLxnbUqVst0iER8XCxisoWL2Yq76IXgmIERfhlkxX3Yspw==
X-Received: by 2002:a05:6870:b00c:b0:206:c25:ef79 with SMTP id y12-20020a056870b00c00b002060c25ef79mr6911116oae.4.1704750099537;
        Mon, 08 Jan 2024 13:41:39 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:7e0f:b0:203:3b8e:507a with SMTP id
 wx15-20020a0568707e0f00b002033b8e507als264109oab.2.-pod-prod-03-us; Mon, 08
 Jan 2024 13:41:39 -0800 (PST)
X-Received: by 2002:a05:6808:2197:b0:3bc:3cba:a6ae with SMTP id be23-20020a056808219700b003bc3cbaa6aemr4010358oib.72.1704750098881;
        Mon, 08 Jan 2024 13:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704750098; cv=none;
        d=google.com; s=arc-20160816;
        b=orKy39ZJH/Yv9L2ni3BqDjoi7/ODNqE3kO3g+6LuoKNqIGxqXAGGMqE4wSIEz3DmX4
         1kncnCdiT9pNaa1FLKAQQ9gM12wskUoq7tDVTngmydJXsvAk+P+O5pn20Pby2FF/Y/jb
         gQHDlUsw97vGQGZXu5qRd/LFhdB4B6eUpnZ7di1cCmL5qJTE6v+6IM1ZlhHoW3TkfzfL
         i78Dfawbux+bM2yMgGV7rjJ0V3SsB7vowVQe+19XEFiFvh8hE0mAfQNYzC2WskM70F4V
         MHX9poWV7zK89etXgHTgnJ0fpC0+BQzpeTZjITq6kJKFQhxVmqq9OiDFFudrO/uyK8J6
         f+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=TuYQ+ygRmZn4Z5nBsdmNBvhWEtM0S1UZFRggoeodI5k=;
        fh=t0h5rXJgHaPw+IxS2U3hbCvzGPWejKCfaHCY83fftFo=;
        b=gq5PjfLQ9rlzxEq9faaOwzfnwLNKoZQBYqsKBdn2t6cQ7xDOrQggdY3wPGoz2p/BUq
         mgRKHGRSIzby81kbZoH2DVkQS2lx1G7uV9uWfmCMRY/dJy2fdbMJx2n7GWzUFOVNGzYh
         RAeHMCd+iXOjqBtPCacRpYXATpwB4OJT8HU+rEQV4/mZ0tnlS2Wh4khoY28/Y5uxwSl1
         OK9yXGqmTHuyr1nPSnFr92NmcOscccao427DO9f9rAFln7YUUV191jLAEd8E5EHrM7N3
         FTfemcbwYTlsriIH4uq1O4kTOYUMLWuSPu3JwZBzmvLwyUqWCsrwiWmOaWgX95/6GFG1
         PBFA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id h5-20020a0cf405000000b0068077cd22c8si791437qvl.298.2024.01.08.13.41.38
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 13:41:38 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-ykuS2z6KOKOQ-swS-bssDg-1; Mon, 08 Jan 2024 16:41:37 -0500
X-MC-Unique: ykuS2z6KOKOQ-swS-bssDg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 412DD83DDE2
	for <linux-cachefs@gapps.redhat.com>; Mon,  8 Jan 2024 21:41:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 3DFA8492BC9; Mon,  8 Jan 2024 21:41:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8342B492BC7;
	Mon,  8 Jan 2024 21:41:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAKXUXMzXN=+hKDPP-RdHKELA_fGA6PcdCj5fXM32qh4Px0Hprg@mail.gmail.com>
References: <CAKXUXMzXN=+hKDPP-RdHKELA_fGA6PcdCj5fXM32qh4Px0Hprg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: dhowells@redhat.com, linux-cachefs@redhat.com,
    linux-fsdevel <linux-fsdevel@vger.kernel.org>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Reference to non-existing CONFIG_NETFS_FSCACHE
MIME-Version: 1.0
Date: Mon, 08 Jan 2024 21:41:35 +0000
Message-ID: <1542013.1704750095@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1542012.1704750095.1@warthog.procyon.org.uk>
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

Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> In commit 62c3b7481b9a ("netfs: Provide a writepages implementation"),
> you have added some code that is included under #ifdef
> CONFIG_NETFS_FSCACHE, but if I read the code correctly, the actual
> intended config here is called CONFIG_FSCACHE.

Yeah - it should be the latter.  Something like the attached patch should fix
it.

David
---
netfs: Fix wrong #ifdef hiding wait

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
---
 fs/netfs/buffered_write.c |    2 +-
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

