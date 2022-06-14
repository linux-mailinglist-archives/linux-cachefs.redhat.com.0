Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203F54B972
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Jun 2022 20:59:23 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-KtIrLDtiPN6i9PZ5PlnCKQ-1; Tue, 14 Jun 2022 14:59:19 -0400
X-MC-Unique: KtIrLDtiPN6i9PZ5PlnCKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51352101A54E;
	Tue, 14 Jun 2022 18:59:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D602D40D2962;
	Tue, 14 Jun 2022 18:59:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7DFB194707E;
	Tue, 14 Jun 2022 18:59:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8AC531947067 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 18:59:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3DD7C1415106; Tue, 14 Jun 2022 18:59:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B4B1415103
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 18:59:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21567801756
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 18:59:15 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-B5YyGejNN3OWYNf_YjsDUA-1; Tue, 14 Jun 2022 14:59:13 -0400
X-MC-Unique: B5YyGejNN3OWYNf_YjsDUA-1
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-fe51318ccfso13766113fac.0
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 11:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P/zvL47bzMX9zv6R9Iu19Vam9aHyZ/GbOGpqtXAWqMc=;
 b=h/tJ/9+BUZDAt/MHpinvxKRaS0zbNUTWPx1g4Ek8tXReqkoEmQCnLKZjzVuFDkixxT
 X5ri+4kcwp6mxDDyvyFWY/vUqr+iqA2wxvaDcM8hXSRfVBzO1mHSJ6blwdWG8A6vceVY
 5cAByIzrT3ihImiTHMb8RRRwfDGgJZJ/2nWJArYYMahujLqEixZu4NVAkI6fU+sQAWiB
 /DjOblinC0VlHZoEBHzATKp0fraJGFHe7Vl1LJ1XAJDiKD1jx88B30lC/3z9HqL77PS/
 HGYUHe36BJksH0Bt/slfCfW+3maIdDfX6uZqv942ufWJpg+eJPYUt5FoF28wUkeSKIhF
 kpaw==
X-Gm-Message-State: AJIora9qc8n3pla+BpKHxSZttzqZGJZwxxqkL54kez6i7youb7v3ch+k
 urOwdhXNd7Rc/cKwajFGTvvhdg==
X-Google-Smtp-Source: AGRyM1ufL5MDqjvHIo4wa13zoHeLqce3gwGBqjZkT/cfGeJacNorGFZd87ZD1rOQxbOuCm8UywPhnQ==
X-Received: by 2002:a05:6870:c151:b0:fe:251b:804c with SMTP id
 g17-20020a056870c15100b000fe251b804cmr3187763oad.15.1655233152767; 
 Tue, 14 Jun 2022 11:59:12 -0700 (PDT)
Received: from [192.168.0.41] ([184.4.90.121])
 by smtp.gmail.com with ESMTPSA id
 x64-20020acae043000000b0032ecb7370ffsm5017316oig.41.2022.06.14.11.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:59:10 -0700 (PDT)
Message-ID: <9ed91f15-420c-3db6-8b3b-85438b02bf97@cloudflare.com>
Date: Tue, 14 Jun 2022 13:59:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
 <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
 <859cb593-9e96-5846-2191-6613677b07c5@cloudflare.com>
 <87o7yvxl4x.fsf@email.froward.int.ebiederm.org>
From: Frederick Lawler <fred@cloudflare.com>
In-Reply-To: <87o7yvxl4x.fsf@email.froward.int.ebiederm.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 6/14/22 11:30 AM, Eric W. Biederman wrote:
> Frederick Lawler <fred@cloudflare.com> writes:
> 
>> On 6/13/22 11:44 PM, Eric W. Biederman wrote:
>>> Frederick Lawler <fred@cloudflare.com> writes:
>>>
>>>> Hi Eric,
>>>>
>>>> On 6/13/22 12:04 PM, Eric W. Biederman wrote:
>>>>> Frederick Lawler <fred@cloudflare.com> writes:
>>>>>
>>>>>> While experimenting with the security_prepare_creds() LSM hook, we
>>>>>> noticed that our EPERM error code was not propagated up the callstack.
>>>>>> Instead ENOMEM is always returned.  As a result, some tools may send a
>>>>>> confusing error message to the user:
>>>>>>
>>>>>> $ unshare -rU
>>>>>> unshare: unshare failed: Cannot allocate memory
>>>>>>
>>>>>> A user would think that the system didn't have enough memory, when
>>>>>> instead the action was denied.
>>>>>>
>>>>>> This problem occurs because prepare_creds() and prepare_kernel_cred()
>>>>>> return NULL when security_prepare_creds() returns an error code. Later,
>>>>>> functions calling prepare_creds() and prepare_kernel_cred() return
>>>>>> ENOMEM because they assume that a NULL meant there was no memory
>>>>>> allocated.
>>>>>>
>>>>>> Fix this by propagating an error code from security_prepare_creds() up
>>>>>> the callstack.
>>>>> Why would it make sense for security_prepare_creds to return an error
>>>>> code other than ENOMEM?
>>>>>    > That seems a bit of a violation of what that function is supposed to do
>>>>>
>>>>
>>>> The API allows LSM authors to decide what error code is returned from the
>>>> cred_prepare hook. security_task_alloc() is a similar hook, and has its return
>>>> code propagated.
>>> It is not an api.  It is an implementation detail of the linux kernel.
>>> It is a set of convenient functions that do a job.
>>> The general rule is we don't support cases without an in-tree user.  I
>>> don't see an in-tree user.
>>>
>>>> I'm proposing we follow security_task_allocs() pattern, and add visibility for
>>>> failure cases in prepare_creds().
>>> I am asking why we would want to.  Especially as it is not an API, and I
>>> don't see any good reason for anything but an -ENOMEM failure to be
>>> supported.
>>>
>> We're writing a LSM BPF policy, and not a new LSM. Our policy aims to solve
>> unprivileged unshare, similar to Debian's patch [1]. We're in a position such
>> that we can't use that patch because we can't block _all_ of our applications
>> from performing an unshare. We prefer a granular approach. LSM BPF seems like a
>> good choice.
> 
> I am quite puzzled why doesn't /proc/sys/user/max_user_namespaces work
> for you?
> 

We have the following requirements:

1. Allow list criteria
2. root user must be able to create namespaces whenever
3. Everything else not in 1 & 2 must be denied

We use per task attributes to determine whether or not we allow/deny the 
current call to unshare().

/proc/sys/user/max_user_namespaces limits are a bit broad for this level 
of detail.

>> Because LSM BPF exposes these hooks, we should probably treat them as an
>> API. From that perspective, userspace expects unshare to return a EPERM
>> when the call is denied permissions.
> 
> The BPF code gets to be treated as a out of tree kernel module.
> 
>>> Without an in-tree user that cares it is probably better to go the
>>> opposite direction and remove the possibility of return anything but
>>> memory allocation failure.  That will make it clearer to implementors
>>> that a general error code is not supported and this is not a location
>>> to implement policy, this is only a hook to allocate state for the LSM.
>>>
>>
>> That's a good point, and it's possible we're using the wrong hook for the
>> policy. Do you know of other hooks we can look into?
> 
> Not off the top of my head.
> 
>>>>> I have probably missed a very interesting discussion where that was
>>>>> mentioned but I don't see link to the discussion or anything explaining
>>>>> why we want to do that in this change.
>>>>>
>>>>
>>>> AFAIK, this is the start of the discussion.
>>> You were on v3 and had an out of tree piece of code so I assumed someone
>>> had at least thought about why you want to implement policy in a piece
>>> of code whose only purpose is to allocate memory to store state.
>>>
>>
>> No worries.
>>
>>> Eric
>>>
>>>
>>
>> Links:
>> 1:
>> https://sources.debian.org/patches/linux/3.16.56-1+deb8u1/debian/add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by-default.patch/
> 
> Eric

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

