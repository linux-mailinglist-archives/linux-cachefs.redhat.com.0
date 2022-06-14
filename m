Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F4454B549
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Jun 2022 18:06:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-RjIrLCAjPP-Izeqosp8rBA-1; Tue, 14 Jun 2022 12:06:33 -0400
X-MC-Unique: RjIrLCAjPP-Izeqosp8rBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D0A180159B;
	Tue, 14 Jun 2022 16:06:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C61A9D7F;
	Tue, 14 Jun 2022 16:06:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D1CFE194707C;
	Tue, 14 Jun 2022 16:06:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 42FCF1947067 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 16:06:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1904B40C1247; Tue, 14 Jun 2022 16:06:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14688400F3FF
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 16:06:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 860AF80159B
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 16:06:29 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-I2pBIiyVP4-xIuhjVDUDQg-1; Tue, 14 Jun 2022 12:06:28 -0400
X-MC-Unique: I2pBIiyVP4-xIuhjVDUDQg-1
Received: by mail-oi1-f182.google.com with SMTP id p8so7796346oip.8
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 09:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X4xRWyF9vr8qnasqfhsd+VAGIzL+N4al4cfXIWCdc0g=;
 b=RhDm+jee0rPAftJaCkoZEyzMSaWZG4YQ2nyzRorWU1QXS/V1j77QBWqvs41w8czG4I
 mmViOBA77+FLW1sm1/fmyHF3oU5KpZ0XpGCLcCNgBVb0B+H4ui2ynpmXKP5AEb2RxvXo
 GeVBDHB1meXY7XEDPcTEtRQJMq4Kys4MoOGsanArWyF/s4IFp9+ONmYsU83Gl2PuUaq8
 FKHsaqb2/NW2AC7w59YpMQKaNKbVG0NoSj1HUcQyoLu6ZBUNY80Py0kNw72VQLuf+JOb
 OI2nvgSHncOB72o6vluzeRL/sjmjwQQeQt7X/9XOJr8DrQJqm5qWMpV8v31Y+OteVjOI
 I7Kg==
X-Gm-Message-State: AOAM532Ry3AfmYImyYaayRztvRupz7lMSUEo81EHbNHaoh5YkfSJPEXA
 sKdaIhm37hC80xARnun8kg+1rQ==
X-Google-Smtp-Source: ABdhPJz9B/kSdK+3GB7ULQc4BQgTDB3yrng0XI1+iE7DuZFwNplTTKpOWFeQG4wG0wSczvdmVlxS5A==
X-Received: by 2002:aca:3945:0:b0:32b:3a61:35d6 with SMTP id
 g66-20020aca3945000000b0032b3a6135d6mr2484880oia.293.1655222787108; 
 Tue, 14 Jun 2022 09:06:27 -0700 (PDT)
Received: from [192.168.0.41] ([184.4.90.121])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a0568301b6100b0060bec21ffcdsm4939272ote.22.2022.06.14.09.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:06:26 -0700 (PDT)
Message-ID: <859cb593-9e96-5846-2191-6613677b07c5@cloudflare.com>
Date: Tue, 14 Jun 2022 11:06:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
 <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
From: Frederick Lawler <fred@cloudflare.com>
In-Reply-To: <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, amir73il@gmail.com,
 Paul Moore <paul@paul-moore.com>, linux-cifs@vger.kernel.org,
 selinux@vger.kernel.org, netdev@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, linux-doc@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel-team@cloudflare.com, serge@hallyn.com
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

On 6/13/22 11:44 PM, Eric W. Biederman wrote:
> Frederick Lawler <fred@cloudflare.com> writes:
> 
>> Hi Eric,
>>
>> On 6/13/22 12:04 PM, Eric W. Biederman wrote:
>>> Frederick Lawler <fred@cloudflare.com> writes:
>>>
>>>> While experimenting with the security_prepare_creds() LSM hook, we
>>>> noticed that our EPERM error code was not propagated up the callstack.
>>>> Instead ENOMEM is always returned.  As a result, some tools may send a
>>>> confusing error message to the user:
>>>>
>>>> $ unshare -rU
>>>> unshare: unshare failed: Cannot allocate memory
>>>>
>>>> A user would think that the system didn't have enough memory, when
>>>> instead the action was denied.
>>>>
>>>> This problem occurs because prepare_creds() and prepare_kernel_cred()
>>>> return NULL when security_prepare_creds() returns an error code. Later,
>>>> functions calling prepare_creds() and prepare_kernel_cred() return
>>>> ENOMEM because they assume that a NULL meant there was no memory
>>>> allocated.
>>>>
>>>> Fix this by propagating an error code from security_prepare_creds() up
>>>> the callstack.
>>> Why would it make sense for security_prepare_creds to return an error
>>> code other than ENOMEM?
>>>   > That seems a bit of a violation of what that function is supposed to do
>>>
>>
>> The API allows LSM authors to decide what error code is returned from the
>> cred_prepare hook. security_task_alloc() is a similar hook, and has its return
>> code propagated.
> 
> It is not an api.  It is an implementation detail of the linux kernel.
> It is a set of convenient functions that do a job.
> 
> The general rule is we don't support cases without an in-tree user.  I
> don't see an in-tree user.
> 
>> I'm proposing we follow security_task_allocs() pattern, and add visibility for
>> failure cases in prepare_creds().
> 
> I am asking why we would want to.  Especially as it is not an API, and I
> don't see any good reason for anything but an -ENOMEM failure to be
> supported.
>
We're writing a LSM BPF policy, and not a new LSM. Our policy aims to 
solve unprivileged unshare, similar to Debian's patch [1]. We're in a 
position such that we can't use that patch because we can't block _all_ 
of our applications from performing an unshare. We prefer a granular 
approach. LSM BPF seems like a good choice.

Because LSM BPF exposes these hooks, we should probably treat them as an 
API. From that perspective, userspace expects unshare to return a EPERM 
when the call is denied permissions.

> Without an in-tree user that cares it is probably better to go the
> opposite direction and remove the possibility of return anything but
> memory allocation failure.  That will make it clearer to implementors
> that a general error code is not supported and this is not a location
> to implement policy, this is only a hook to allocate state for the LSM.
> 

That's a good point, and it's possible we're using the wrong hook for 
the policy. Do you know of other hooks we can look into?

>>> I have probably missed a very interesting discussion where that was
>>> mentioned but I don't see link to the discussion or anything explaining
>>> why we want to do that in this change.
>>>
>>
>> AFAIK, this is the start of the discussion.
> 
> You were on v3 and had an out of tree piece of code so I assumed someone
> had at least thought about why you want to implement policy in a piece
> of code whose only purpose is to allocate memory to store state.
> 

No worries.

> Eric
> 
> 
> 

Links:
1: 
https://sources.debian.org/patches/linux/3.16.56-1+deb8u1/debian/add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by-default.patch/

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

