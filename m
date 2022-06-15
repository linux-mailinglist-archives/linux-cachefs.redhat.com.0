Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D897A54CD37
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Jun 2022 17:41:23 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-nnDuu2wWMpSzG2NXoa4uoQ-1; Wed, 15 Jun 2022 11:41:22 -0400
X-MC-Unique: nnDuu2wWMpSzG2NXoa4uoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5363383397C;
	Wed, 15 Jun 2022 15:41:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B30540C141F;
	Wed, 15 Jun 2022 15:41:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 04DEA1947042;
	Wed, 15 Jun 2022 15:41:20 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 619B019466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 15 Jun 2022 15:33:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 343B840CFD0A; Wed, 15 Jun 2022 15:33:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3023E40CF8E7
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 15:33:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1888585A580
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 15:33:52 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-8Rj2pUG-PCmSrdIfC3YOMw-1; Wed, 15 Jun 2022 11:33:50 -0400
X-MC-Unique: 8Rj2pUG-PCmSrdIfC3YOMw-1
Received: by mail-wm1-f44.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so1334892wms.3
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 08:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5eKPAN5lqKWqHRVMFEt8bECLi2YfU3n/Xvj8y2gEBE=;
 b=U3ENNEtIGy5nfaMOIjH4rBI+si3whYwuBKxC/USVYaqlG9DEYW3QYynuBlND4rgRWN
 Q3y9m49f+wlohCILGBQ8+MvsNDyDAvAFdXnVsenlrjySaDlRhiXoCFlFTDokc88u+ika
 FpQcUqG/uKH2FCYk2bbxwCC3s3BA+YIUKMYzQUcCQwppRKIcd8/DfqjXRJfO7Oh8XXpv
 tOw4FgZ5xrcxQnw2Ekby9oGsiJtKp5zq8z+w/WtDBIlwbfYDAvk6V3j4g8w/icTQSA5e
 hR16+U5rlgOsvgQGKniMG71imqAAnJZqwFnbQM+6TGDVm0Wg7sL0J/H0wf9KQ7bA5uVQ
 XNCA==
X-Gm-Message-State: AJIora/FVvWXZVvytSII/tNEaIsJceVbPXs1EKtvQI4KKDL8tuwzt6Dp
 Vg3wRy6MSTVPhNqwdTVeAdPtNEscF43v+G8NNJ35
X-Google-Smtp-Source: AGRyM1tbSXhyojX0sdqJuy36Y8CiIJerDEBwNNO0en1/SGp4CFCRbzqu86TVD3k4/Lh2/5SBr3CWSXHz2TZ3Gh292cQ=
X-Received: by 2002:a05:600c:1d91:b0:39c:544b:abdd with SMTP id
 p17-20020a05600c1d9100b0039c544babddmr20003wms.70.1655307229181; Wed, 15 Jun
 2022 08:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
 <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
 <859cb593-9e96-5846-2191-6613677b07c5@cloudflare.com>
 <87o7yvxl4x.fsf@email.froward.int.ebiederm.org>
 <9ed91f15-420c-3db6-8b3b-85438b02bf97@cloudflare.com>
 <20220615103031.qkzae4xr34wysj4b@wittgenstein>
 <CAHC9VhR8yPHZb2sCu4JGgXOSs7rudm=9opB+-LsG6_Lta9466A@mail.gmail.com>
 <CALrw=nGZtrNYn+CV+Q_w-2=Va_9m3C8PDvvPtd01d0tS=2NMWQ@mail.gmail.com>
In-Reply-To: <CALrw=nGZtrNYn+CV+Q_w-2=Va_9m3C8PDvvPtd01d0tS=2NMWQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 15 Jun 2022 11:33:38 -0400
Message-ID: <CAHC9VhRSzXeAZmBdNSAFEh=6XR57ecO7Ov+6BV9b0xVN1YR_Qw@mail.gmail.com>
To: Ignat Korchagin <ignat@cloudflare.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v3] cred: Propagate
 security_prepare_creds() error code
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
Cc: linux-aio@kvack.org, Christian Brauner <brauner@kernel.org>,
 linux-doc@vger.kernel.org, selinux@vger.kernel.org, linux-cifs@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, amir73il@gmail.com,
 samba-technical@lists.samba.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 netdev <netdev@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 kernel-team <kernel-team@cloudflare.com>, linux-nfs@vger.kernel.org,
 Frederick Lawler <fred@cloudflare.com>, serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 15, 2022 at 11:06 AM Ignat Korchagin <ignat@cloudflare.com> wrote:
> On Wed, Jun 15, 2022 at 3:14 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Wed, Jun 15, 2022 at 6:30 AM Christian Brauner <brauner@kernel.org> wrote:

...

> > > Fwiw, from this commit it wasn't very clear what you wanted to achieve
> > > with this. It might be worth considering adding a new security hook for
> > > this. Within msft it recently came up SELinux might have an interest in
> > > something like this as well.
> >
> > Just to clarify things a bit, I believe SELinux would have an interest
> > in a LSM hook capable of implementing an access control point for user
> > namespaces regardless of Microsoft's current needs.  I suspect due to
> > the security relevant nature of user namespaces most other LSMs would
> > be interested as well; it seems like a well crafted hook would be
> > welcome by most folks I think.
>
> Just to get the full picture: is there actually a good reason not to
> make this hook support this scenario? I understand it was not
> originally intended for this, but it is well positioned in the code,
> covers multiple subsystems (not only user namespaces), doesn't require
> changing the LSM interface and it already does the job - just the
> kernel internals need to respect the error code better. What bad
> things can happen if we extend its use case to not only allocate
> resources in LSMs?

My concern is that the security_prepare_creds() hook, while only
called from two different functions, ends up being called for a
variety of different uses (look at the prepare_creds() and
perpare_kernel_cred() callers) and I think it would be a challenge to
identify the proper calling context in the LSM hook implementation
given the current hook parameters.  One might be able to modify the
hook to pass the necessary information, but I don't think that would
be any cleaner than adding a userns specific hook.  I'm also guessing
that the modified security_prepare_creds() hook implementations would
also be more likely to encounter future maintenance issues as
overriding credentials in the kernel seems only to be increasing, and
each future caller would risk using the modified hook wrong by passing
the wrong context and triggering the wrong behavior in the LSM.

-- 
paul-moore.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

