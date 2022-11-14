Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E41628159
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Nov 2022 14:33:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668432832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=daQuZMwTD0Tz/Hnx83eBPhvuU4fc01IzOtFQGMQq0mU=;
	b=Vty2NpI028LPG6Is5WKfGVUREtioXEJYPZDSK08Mko4W2Kk3fN/nyDDaNqVDQJKv74T8aN
	lzqHSi0Ip5eLB4aTOaYbhRrBmoVqcWwNDYIPnGuZjaojHghgLIJ23GZwhO+ZxcATqbWs1q
	4g4b6GTojPD7WcWFI1mfsiv7V9BQy/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-jNLy1onHPcCHUQvVVPc74g-1; Mon, 14 Nov 2022 08:33:48 -0500
X-MC-Unique: jNLy1onHPcCHUQvVVPc74g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DA56811E75;
	Mon, 14 Nov 2022 13:33:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 039531415102;
	Mon, 14 Nov 2022 13:33:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC9E4194658F;
	Mon, 14 Nov 2022 13:33:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABE551946589 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 14 Nov 2022 13:33:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7A07640C845B; Mon, 14 Nov 2022 13:33:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72BCD40C83EE
 for <linux-cachefs@redhat.com>; Mon, 14 Nov 2022 13:33:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F300101A528
 for <linux-cachefs@redhat.com>; Mon, 14 Nov 2022 13:33:46 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-Na_I2onwNsujouUOcd20FA-1; Mon, 14 Nov 2022 08:33:42 -0500
X-MC-Unique: Na_I2onwNsujouUOcd20FA-1
Received: by mail-yb1-f182.google.com with SMTP id g127so13406207ybg.8
 for <linux-cachefs@redhat.com>; Mon, 14 Nov 2022 05:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WP+HYwHdjYCDFg9djfwnhXXz90w93wYmYtQG16AJnX0=;
 b=fBW4/RgTrmA7mLSsJzv2pcw9tyqcS6AZuGVnKeuWLfsc/x4USjIjA53FrQY8u7LLUt
 wqMEMD2GpLU1d8/VfNFeGi9r+WGYat/GdKAiYTCesPuj7k/CV+uRdGiYsIdJ5UrSr74b
 vCC60w5o5BRWsmiCGtXyuctBcC8kvTWp2f1zrGBtmE29NX5G9XgddYnCbLE41Nu4QoSO
 lhYIvP6EVjpdQUL/ekbKtZPNw4FeEVLQnpLSrzRZcAzMGFNhVpD0/oNzd2MJPzpU3vpa
 Epm0PjiwiKSMku9e7eCGaKVuDfn8HETSFh3a//tA14EfR5Xup3KpOPiId8uZPS43Xw0O
 VWXQ==
X-Gm-Message-State: ANoB5pklC9KM1PctrPdBdzFvqYsRiKGVj073jxR1KVYD7UCwDADiDVOW
 JBgeqjbEhR3rYnX6+i1pCyD46XgvmxBbLJm/NMJzQw==
X-Google-Smtp-Source: AA0mqf7LuOJHR5SVvxrPRzhIf+0soaX9o8B6BgwaD8f9F/qQu6GfdUGU1B8gbenuM9GnNTSEJibDNGrCylQaNlkQyuk=
X-Received: by 2002:a25:441:0:b0:6dd:58bd:727f with SMTP id
 62-20020a250441000000b006dd58bd727fmr11856790ybe.621.1668432822251; Mon, 14
 Nov 2022 05:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20221017105212.77588-1-dwysocha@redhat.com>
 <20221017105212.77588-4-dwysocha@redhat.com>
 <870684b35a45b94c426554a62b63f80f421dbb08.camel@kernel.org>
 <CALF+zOm+-2QLOMu4J7NAK++xfjZ8SQqmMh8zNFcM2H78_qYAzA@mail.gmail.com>
 <0676ecb2bb708e6fc29dbbe6b44551d6a0d021dc.camel@kernel.org>
 <CALF+zOnRH_GiZooiNm1=J+gOpLMEncO72SA4jAmL+agG9RjbYg@mail.gmail.com>
 <CALF+zOmDzp-UhLC0Dk4fmsjEzWgM75m5uOMBjv6TjTFYtbWPAQ@mail.gmail.com>
 <1B2E1442-EB0A-43E3-96BB-15C717E966E5@hammerspace.com>
 <CA+QRt4vM3NncgCWjKncorHmiWpCrJ7FsLC=y+v7gnEwYpM3PSw@mail.gmail.com>
 <CALF+zOkxbLV4qzkaydBThmKfQKOP07jyq8o10YMfP2TgvAdZMQ@mail.gmail.com>
 <CA+QRt4v2qP5gAxiwYbyHEQHOCG4=fVDBwSBsXJrXb=GaFCKtYg@mail.gmail.com>
In-Reply-To: <CA+QRt4v2qP5gAxiwYbyHEQHOCG4=fVDBwSBsXJrXb=GaFCKtYg@mail.gmail.com>
From: Daire Byrne <daire@dneg.com>
Date: Mon, 14 Nov 2022 13:33:05 +0000
Message-ID: <CAPt2mGMH7_z10mNUytRd29tAjViqW019ffv8+_rn2PJQYRUgMg@mail.gmail.com>
To: Benjamin Maynard <benmaynard@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v9 3/5] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Brennan Doyle <brennandoyle@google.com>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trondmy@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 14 Nov 2022 at 12:44, Benjamin Maynard <benmaynard@google.com> wrote:
>
> Thanks Dave for getting back to me so quickly.
>
> > Due to use of "drop_caches" this is almost certainly the known issue #1
> > I mentioned in the opening post of this series:
> > https://lore.kernel.org/all/20221103161637.1725471-1-dwysocha@redhat.com/
>
> Apologies, I completely missed the known issues in the original
> opening message of the series. Just to clarify, I was only ever
> dropping the caches on the "NFS Client" in the below relationship:
>
> Source NFS Server <-- Re-Export Server (with FS-Cache) <-- NFS Client.
>
> I never dropped the caches on the Re-Export Server (the server running
> FS-Cache) at any point.

So I have never actually done that particular test (I will need to
verify, but I think I would have noticed by now), but dropping caches
on the re-export server definitely caused repeat reads from "source"
NFS server and (re)writes to the fscache disk *without* David's
suggested patch. With the patch, you can drop caches on the re-export
server and get the repeat reads coming from the fscache disk as
expected.

You can certainly try that test too (just source NFS server ->
FS-cache client - read,drop cache,read).

I'm not sure about your particular test, but your re-export server
must have dropped the file from memory otherwise you would see the
repeat read just coming from page cache (with no fscache or disk cache
interaction required)? So I'll assume the file in question is too
large to fit into memory and effectively the cache has been dropped.
So I think the suggested patch on the re-export server will fix that
issue.

I should also add that I had this series working well (+suggested
patch) and the performance to/from disk cache is an order of magnitude
better than mainline (40MB/s vs 5000MB/s with NVMe), but it did expose
a race condition in the fscache use/unuse cookie code (David is
aware). In the NFS re-export case, we have lots of knfsd threads
thrashing around the netfs/fscache functions.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

