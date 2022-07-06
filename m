Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C383567B2E
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Jul 2022 02:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657069137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x4pjkrZ5dyMm+87bE2IqDPqRmztFW+AqDrv2GXN7OBE=;
	b=cVMKOy0ImHl5q5jG1+ScVyvoY4YLHkGA3TZ6RCv27QELJgc+lGoIAZmSTetFGgRxxJz5h+
	AaIne4Tb5rtU3+RZy48+WS2sQ4Wrw5HQn71KPKFVolIzlh6UmcCCppjnuQOm5fCSKVFuXE
	UqCqwcx1UghbqxxtxVdA8gunfQQdX1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-Rpyzw1uEMjiuMkkF1s1hEA-1; Tue, 05 Jul 2022 20:58:54 -0400
X-MC-Unique: Rpyzw1uEMjiuMkkF1s1hEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FA0F802D1F;
	Wed,  6 Jul 2022 00:58:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4FA29D7F;
	Wed,  6 Jul 2022 00:58:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B2031947062;
	Wed,  6 Jul 2022 00:58:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 69782194705D for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Jul 2022 00:58:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5B9BCC28133; Wed,  6 Jul 2022 00:58:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57357C2812B
 for <linux-cachefs@redhat.com>; Wed,  6 Jul 2022 00:58:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DEDB3C025BD
 for <linux-cachefs@redhat.com>; Wed,  6 Jul 2022 00:58:51 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-2LgjIX27Ow636AIqoOO3Gw-1; Tue, 05 Jul 2022 20:58:50 -0400
X-MC-Unique: 2LgjIX27Ow636AIqoOO3Gw-1
Received: by mail-pg1-f199.google.com with SMTP id
 196-20020a6300cd000000b0040c9c64e7e4so5255001pga.9
 for <linux-cachefs@redhat.com>; Tue, 05 Jul 2022 17:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=L/VIshmF4xT9wjWGvPNSfMhdl0xNY9tpFrPyWnO0aT8=;
 b=u3xz26yxJz0P5MYt+4KC9JAg8yEZuTd9/u9knZzwRuJA+lfo+b4nqZuxMlGaALl7Ih
 Szr++5dIqfb9spf/feqa45u2bgHiB1SWzu68vbS82Fq3wn2czxFIYXAftWGYmJe9xaV2
 hfaTiY0uV9fG5d+F0OBookecl9XJJpPZFLRHsTDZjw61ZUTDu3B56Cf9WHt43RbtHBxl
 XjcfdK+8VZl1eqL6r/M93duXXUVtmQ985YTArLr0XfI7v8nn9gqcGP0nO/g336CpuU5Z
 JQC7fc/NvsRGfD65USuK+Xec0Fr2jREjqtLI7XApcwDNiOzkELtAKtaQJRoNUAxVFgm8
 8yTw==
X-Gm-Message-State: AJIora9rhsGT+gutj9sEUuEscVTBoonNvFDhpbzckrg6Ns5JbKHTwYeY
 J8AY0zThBYvgTKFZJ6Up9IG1EbywVqL3WwD95okw1cUgwoIDj0gwtyvXAEv4mRzrjD4SYgbNm85
 ClKVDWaDuVzk5GoJajhu5sJkSFo3uNBhPR9X5ifVewyptxLCdivaoh44bc8R23vb2BZ2IP4A=
X-Received: by 2002:a17:90a:e7c6:b0:1ef:9ab6:406e with SMTP id
 kb6-20020a17090ae7c600b001ef9ab6406emr7426880pjb.108.1657069128764; 
 Tue, 05 Jul 2022 17:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1silTss9+EIoox09QHdHlVkmVoGOPWNKlZe23v0wKMWdZReT8feVbKNmYUOn6gMvpy4A5MnbA==
X-Received: by 2002:a17:90a:e7c6:b0:1ef:9ab6:406e with SMTP id
 kb6-20020a17090ae7c600b001ef9ab6406emr7426844pjb.108.1657069128474; 
 Tue, 05 Jul 2022 17:58:48 -0700 (PDT)
Received: from [10.72.12.227] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170903110d00b0016bec529f77sm3774563plh.272.2022.07.05.17.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 17:58:47 -0700 (PDT)
To: David Howells <dhowells@redhat.com>, Jeff Layton <jlayton@kernel.org>
References: <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
 <20220701022947.10716-1-xiubli@redhat.com>
 <20220701022947.10716-2-xiubli@redhat.com>
 <2187946.1657027284@warthog.procyon.org.uk>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <8ce8c30f-8a33-87e7-1bdc-b73d5b933c85@redhat.com>
Date: Wed, 6 Jul 2022 08:58:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2187946.1657027284@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: release the folio lock and
 put the folio before retrying
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, idryomov@gmail.com,
 ceph-devel@vger.kernel.org, vshankar@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 7/5/22 9:21 PM, David Howells wrote:
> Jeff Layton <jlayton@kernel.org> wrote:
>
>> I don't know here... I think it might be better to just expect that when
>> this function returns an error that the folio has already been unlocked.
>> Doing it this way will mean that you will lock and unlock the folio a
>> second time for no reason.
> I seem to remember there was some reason you wanted the folio unlocking and
> putting.  I guess you need to drop the ref to flush it.
>
> Would it make sense for ->check_write_begin() to be passed a "struct folio
> **folio" rather than "struct folio *folio" and then the filesystem can clear
> *folio if it disposes of the page?

Yeah, this also sounds good to me.

-- Xiubo


> David
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

