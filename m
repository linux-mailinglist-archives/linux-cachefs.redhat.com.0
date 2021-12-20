Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2B47B2D5
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Dec 2021 19:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640024881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cu+Kxz+dwB/2Stfm+GlYz0on5yZlz0TS4TTue7OP9po=;
	b=huSTKH1o6caNbCAfYSpL77GzXJbRo2gb1N5gb+dmxvG8sTSodjIZHaUU85X5bC/8iN/RDJ
	IAJJFf4YldygocFTkVMgCgHpiTT3FDL3P8A5F1rrbQvktxv6YAJsKhFOO3+CrcpsgTxxea
	danZW9gXoKnuS48bfZYjllCLwfOElCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-3GWuwt8qMOGjBafYFtIpog-1; Mon, 20 Dec 2021 13:28:00 -0500
X-MC-Unique: 3GWuwt8qMOGjBafYFtIpog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE47E81EE60;
	Mon, 20 Dec 2021 18:27:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48335101E594;
	Mon, 20 Dec 2021 18:27:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 521A84BB7C;
	Mon, 20 Dec 2021 18:27:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BKIRomw015285 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 20 Dec 2021 13:27:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B2B552166B40; Mon, 20 Dec 2021 18:27:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE1672166B2F
	for <linux-cachefs@redhat.com>; Mon, 20 Dec 2021 18:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C449E3C0012B
	for <linux-cachefs@redhat.com>; Mon, 20 Dec 2021 18:27:47 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-296-5xH6mxRyPWuSrTsEFqAAOg-1; Mon, 20 Dec 2021 13:27:46 -0500
X-MC-Unique: 5xH6mxRyPWuSrTsEFqAAOg-1
Received: by mail-ed1-f69.google.com with SMTP id
	t1-20020a056402524100b003f8500f6e35so3347223edd.8
	for <linux-cachefs@redhat.com>; Mon, 20 Dec 2021 10:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1Eo3PKtw1L761aiISGa6jWzJcqIXJLNEgiul4itzHnM=;
	b=Oo9clRROY/zf34y7uGsppF1axgIcuG+iOmyYV0L+KfGtRQ0GdGOUSlk4a5hkm1kaj4
	5xbCGWzLxOrBThGxrnr5wp6wJZZ3dW3c+HicEhKEjZ1V/KC/v8AcH99bI9ChrllMoeAH
	Tqb7aaoHqhJLKlkAB1eVd7O9wVav9PKuNGFdR4m7b3dcqGoR1zVUJxcLDMmcU6SYUpeM
	0x5G1lVF8RGaOfaIspDGEKAOvoUkFM95sD9BxF3I00NygPR9tMyXaeFQsjgMoU4Axb89
	KyB9Qe0hVFJifDZUxxP2cH8a9oSybx4toBU8Py05xspNZVAg18M42wjLJAnF7RTdYaHz
	zkEg==
X-Gm-Message-State: AOAM531TJl4Vyik9Hoxoy81JHF/ULQfxrtqWJRVX8jQ/Km1S/7FxsAg7
	E6wKX04KOyO5/fKw2BI2V8QnV0u2KKt1QEMSDx1lgWPY73IO4/2mjKIOv3yooUZr7VbzvuF/5/O
	IJBAdfAgaAr09Xk7lJlm5LENHPSBgAzAkh/c/cg==
X-Received: by 2002:a17:907:d0b:: with SMTP id
	gn11mr2941567ejc.379.1640024865093; 
	Mon, 20 Dec 2021 10:27:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsb7294ZUyIi9Ku5TPRgq/C5Xg9zgKzsM3DjhBoNTNnq5uCNEf+0Wayg03IyqowxVtm4R3bnrYvm1EQxblzk8=
X-Received: by 2002:a17:907:d0b:: with SMTP id
	gn11mr2941555ejc.379.1640024864936; 
	Mon, 20 Dec 2021 10:27:44 -0800 (PST)
MIME-Version: 1.0
References: <1639763665-4917-1-git-send-email-dwysocha@redhat.com>
	<1639763665-4917-3-git-send-email-dwysocha@redhat.com>
	<2512433.1640021388@warthog.procyon.org.uk>
In-Reply-To: <2512433.1640021388@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 20 Dec 2021 13:27:08 -0500
Message-ID: <CALF+zOnx8iAoOrOdmYZOaVB--EdfD8-ijM3iT0w4F+kn4p7rSw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 2/4] NFS: Rename fscache read and
	write pages functions
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 20, 2021 at 12:30 PM David Howells <dhowells@redhat.com> wrote:
>
> Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> > Rename NFS fscache functions in a more consistent fashion
> > to better reflect when we read from and write to fscache.
>
> Do you want me to merge this into my patch that rewrites the nfs cache I/O?
>

Yes, I think it makes sense to merge this patch with the following
patch from your series:
[PATCH v3 64/68] nfs: Implement cache I/O by accessing the cache directly

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

