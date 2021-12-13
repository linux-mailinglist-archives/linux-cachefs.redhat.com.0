Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8696473662
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Dec 2021 22:06:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639429576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tD8ss4KXF23LPxeyLIU75oe6kFDQp59qYGHIHP8pgqE=;
	b=SkK4AHtvDQJV+lo/6px0lXC26/So8gO2oouv2bMLsRhzxC/ePfU5Qslf8VDGo2HfGUuSZi
	KLPLsjcb7qBaJkuBd5GebGSIP5PAU+EVKNTrCYD31y6DEApyUjtpSlpHvFEqWtFturryYP
	NqguQ+VALgfpxTTGz0xk3Q7csTT+TmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-r-m02W_FNzqiEneXm0r45A-1; Mon, 13 Dec 2021 16:06:13 -0500
X-MC-Unique: r-m02W_FNzqiEneXm0r45A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC274100CCC1;
	Mon, 13 Dec 2021 21:06:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C72F60C17;
	Mon, 13 Dec 2021 21:06:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9211B1809C87;
	Mon, 13 Dec 2021 21:06:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BDL63qD021941 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Dec 2021 16:06:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD2C1400D3CA; Mon, 13 Dec 2021 21:06:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8C9840149A4
	for <linux-cachefs@redhat.com>; Mon, 13 Dec 2021 21:06:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF99F811E78
	for <linux-cachefs@redhat.com>; Mon, 13 Dec 2021 21:06:03 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-593-eJhZqwagPGuIHEs5EKVeAQ-1; Mon, 13 Dec 2021 16:06:02 -0500
X-MC-Unique: eJhZqwagPGuIHEs5EKVeAQ-1
Received: by mail-ed1-f70.google.com with SMTP id
	y9-20020aa7c249000000b003e7bf7a1579so15044465edo.5
	for <linux-cachefs@redhat.com>; Mon, 13 Dec 2021 13:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TT/gq1NqQbt1n10mE+9S+/x8qCpJ6xMxDtVYZGzNZE4=;
	b=CDzpOokH9b0Nrd7NLmDBEO9pmnCqNLT/dlWsZHEa961vftaIXb0CsG7Urx+mXBxevx
	VT+JI0eGh2ggQ+X7bwFzGU9hh7C3Ws9Eq4bK4NTa6/DaXAXHJ/ZGNoUqyZpZOZOR/oPg
	Z7mFDXbwZaLaBApXCvVwDL7y2hBtg5TmCOyoUdhXPMt/IEOTkJRTr88GDZHlg7Hcsyis
	jDHpG5K8R/EznFiu1v1VjQgNHiMuJg9Fo5g2YnhzH7gF8CP2aE0MrEatVtxcchcUJ/Pc
	ib60L+q2VChgt+OeByzq1zVzRdI9j1hqw4VP8Dl26Mjku5A7Ck82Ur7N2MCBABnerQxf
	VMOA==
X-Gm-Message-State: AOAM531W6vMruJd6eBkdxdlayR7jQslh4ip6uAwAo/vR/Ht6MG57xqPI
	kObjuqRNNks/aN7J0rEFicp+x5mVvpXkEINNyKrKFz2zBOuLWwDOQ8Jt0dmhME95f+K5CRFm811
	k8/A8749jZ6jLwwjEsI06Cz2ATNv06CYfG7oxFg==
X-Received: by 2002:a17:907:75fb:: with SMTP id
	jz27mr793449ejc.623.1639429561166; 
	Mon, 13 Dec 2021 13:06:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4NjlrB/AU0qc2PXB1u/hctD92UOUgZHL1rsQyb7txMh2VUaIkOIe0h8SvIBIMtXdVvLsQghzif+k79HmKhNQ=
X-Received: by 2002:a17:907:75fb:: with SMTP id
	jz27mr793425ejc.623.1639429560945; 
	Mon, 13 Dec 2021 13:06:00 -0800 (PST)
MIME-Version: 1.0
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<CALF+zOnA2U6LjDTE8m2REDTMmFVnWkcBkn0ZJQRGULPUjeQW4Q@mail.gmail.com>
	<CALF+zOnmJ0=j8pEMikpxYgLrS10gVZiXfCjBhDz9Je0Qip7wnw@mail.gmail.com>
	<599331.1639410068@warthog.procyon.org.uk>
In-Reply-To: <599331.1639410068@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 13 Dec 2021 16:05:25 -0500
Message-ID: <CALF+zO=_DeOHLARqFqZ2qL04PcwBGOxTXf5UUdBNQj29yOSYvw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] [PATCH] fscache: Need to go round again after
 processing LRU_DISCARDING state
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 13, 2021 at 10:41 AM David Howells <dhowells@redhat.com> wrote:
>
> David Wysochanski <dwysocha@redhat.com> wrote:
>
> > > [  432.921382] BUG: KASAN: use-after-free in
> > > fscache_unhash_cookie+0x9e/0x160 [fscache]^M
>
> I think the patch below is the way to fix this.
>
> David
> ---
> fscache: Need to go round again after processing LRU_DISCARDING state
>
> There's a race between the LRU discard and relinquishment actions.  In the
> state machine, fscache_cookie_state_machine(), the ACTIVE state transits to
> the LRU_DISCARD state in preference to transiting to the RELINQUISHING or
> WITHDRAWING states.
>
> This should be fine, but the LRU_DISCARDING state just breaks out the
> bottom of the function without going round again after transiting to the
> QUIESCENT state.
>
> However, if both LRU discard and relinquishment happen *before* the SM
> runs, one of the queue events will get discarded, along with the ref that
> would be associated with it.  The last ref is then discarded and the cookie
> is removed without completing the relinquishment process - leaving the
> cookie hashed.
>
> The fix is to make sure that the SM always goes back around after changing
> the state.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>
> diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
> index d7e825d636e2..8d0769a5ee2b 100644
> --- a/fs/fscache/cookie.c
> +++ b/fs/fscache/cookie.c
> @@ -755,7 +755,7 @@ static void fscache_cookie_state_machine(struct fscache_cookie *cookie)
>                 set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
>                 __fscache_set_cookie_state(cookie, FSCACHE_COOKIE_STATE_QUIESCENT);
>                 wake = true;
> -               break;
> +               goto again_locked;
>
>         case FSCACHE_COOKIE_STATE_DROPPED:
>                 break;
>

Agree and verified with xfstests generic full runs twice with NFSv3.
Prior to this patch with NFSv3 xfstest I'd regularly see the crash:
BUG: KASAN: use-after-free in __fscache_acquire_cookie+0x437
https://marc.info/?l=v9fs-developer&m=163916153103008&w=2
https://marc.info/?l=linux-nfs&m=163917893813589&w=2

Tested-by: Dave Wysochanski <dwysocha@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

