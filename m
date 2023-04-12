Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89F6DFB5B
	for <lists+linux-cachefs@lfdr.de>; Wed, 12 Apr 2023 18:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681316881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6kKDMSmRYEIgz/GebsKRry4JXS6kDguaIS93XFqCQ9c=;
	b=AKD8oKwqR+ze7CyXMmGiM5gBii1uhLMvbATOH/smtbiAjRFsJ1NYUEPDzT9NlhxjApuXCx
	4eEzwSRJ1F4O+1yxDTFiqyIwnpdf/xFrteyNp0nl1IQJNh9AYa3ClpTHMfRrjfP5lhPZA/
	iuZQz69pBrVgEAJUZcAZJLn0rvpz0XQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-RG8B0MTDOpyNSqABzVs7qw-1; Wed, 12 Apr 2023 12:27:58 -0400
X-MC-Unique: RG8B0MTDOpyNSqABzVs7qw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3765A3C1485C;
	Wed, 12 Apr 2023 16:27:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5343B40C20FA;
	Wed, 12 Apr 2023 16:27:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 084281946597;
	Wed, 12 Apr 2023 16:27:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D20BB1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 12 Apr 2023 16:27:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9003640C6E71; Wed, 12 Apr 2023 16:27:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88A6540C6E70
 for <linux-cachefs@redhat.com>; Wed, 12 Apr 2023 16:27:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EB9B811E7C
 for <linux-cachefs@redhat.com>; Wed, 12 Apr 2023 16:27:55 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-mxa1_MhIOjCNX7tDtgyh1A-1; Wed, 12 Apr 2023 12:27:53 -0400
X-MC-Unique: mxa1_MhIOjCNX7tDtgyh1A-1
Received: by mail-ej1-f49.google.com with SMTP id q23so20840407ejz.3
 for <linux-cachefs@redhat.com>; Wed, 12 Apr 2023 09:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681316872; x=1683908872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LlbBUU3Heh2HbQgGaI5PMM5WO9GB4tDWoyyHCpBYNx4=;
 b=hSSGZJvoBzQbWlMGp9FvkRsW+tV7NN9x0MAGdU6Irz2ghTY2gJkFwMivosBuXjPhxh
 PNPI3VAsVel9NVF5e7pKQxMCi7Afp+phGFmra8w4WdwSLt6E1hsCXUN+aVDyOvpuijOG
 eYCtTxAKMVzu4B7x3AOnLY27jMcx2qS8LMIrn+LYhslTICmersJ2R6/6nsQFlvWoZRPd
 wJhpkJILtg831KTZ5kxEZrNvHPpBZ50ckXJUxVc8ssZeMeyqXv+tUU7OekDZkB0GgNAy
 sYIOdbS2EqJrOglgAa0DjFCfRxl0FQRThCqngxcNepLv3g0NIXEv6L3S5i+t7Nph6QmH
 leyw==
X-Gm-Message-State: AAQBX9csKJv757TB9LS3UXevyUsenyFRrb5kHni95tpSW59rwX0JbGIc
 i0kHzWchDtzwl2pnnEfgSV1H21dNuEUPAQyYMEB6BQ==
X-Google-Smtp-Source: AKy350Yhw7opfsG2TWgfnDSqwHyjMEzeSuol650BkOrvJ8B9V9IwD4KJEKI7Wqj+BMuqhp8qr/9F4w==
X-Received: by 2002:a17:906:eea:b0:88f:a236:69e6 with SMTP id
 x10-20020a1709060eea00b0088fa23669e6mr13844981eji.7.1681316871897; 
 Wed, 12 Apr 2023 09:27:51 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 ta22-20020a1709078c1600b0094e7bb22860sm387329ejc.50.2023.04.12.09.27.50
 for <linux-cachefs@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 09:27:50 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-94a342ef3beso229187066b.0
 for <linux-cachefs@redhat.com>; Wed, 12 Apr 2023 09:27:50 -0700 (PDT)
X-Received: by 2002:a50:9fa2:0:b0:504:81d3:48f with SMTP id
 c31-20020a509fa2000000b0050481d3048fmr3195779edf.2.1681316870239; Wed, 12 Apr
 2023 09:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <110100.1681301937@warthog.procyon.org.uk>
In-Reply-To: <110100.1681301937@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 12 Apr 2023 09:27:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjJt-6_PJ=hm2_TzwVHcWSatMCiByrFiUizpteogGNibA@mail.gmail.com>
Message-ID: <CAHk-=wjJt-6_PJ=hm2_TzwVHcWSatMCiByrFiUizpteogGNibA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH] netfs: Fix netfs_extract_iter_to_sg()
 for ITER_UBUF/IOVEC
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgNToxOeKAr0FNIERhdmlkIEhvd2VsbHMgPGRob3dlbGxz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gQ291bGQgeW91IGFwcGx5IHRoaXMsIHBsZWFzZT8gIEl0
IGRvZXNuJ3QgYWZmZWN0IGFueXRoaW5nIHlldCwgYnV0IEkgaGF2ZQo+IHBhdGNoZXMgaW4gdGhl
IHdvcmtzIHRoYXQgd2lsbCB1c2UgaXQuCgpBcHBsaWVkLAoKICAgICAgICAgICAgIExpbnVzCgot
LQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

