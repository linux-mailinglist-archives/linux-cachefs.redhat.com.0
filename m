Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ACE54A032
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jun 2022 22:52:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-uuO_R9xKPjOIa6CsLtXy2Q-1; Mon, 13 Jun 2022 16:52:56 -0400
X-MC-Unique: uuO_R9xKPjOIa6CsLtXy2Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E60A185A581;
	Mon, 13 Jun 2022 20:52:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50DAB492C3B;
	Mon, 13 Jun 2022 20:52:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6900194706D;
	Mon, 13 Jun 2022 20:52:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 32FDB194705B for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 13 Jun 2022 20:52:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1C7AF1400E70; Mon, 13 Jun 2022 20:52:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1859E1402406
 for <linux-cachefs@redhat.com>; Mon, 13 Jun 2022 20:52:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 006A5101AA45
 for <linux-cachefs@redhat.com>; Mon, 13 Jun 2022 20:52:51 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-94J7pHmMNUmehyWTUC6fHA-1; Mon, 13 Jun 2022 16:52:41 -0400
X-MC-Unique: 94J7pHmMNUmehyWTUC6fHA-1
Received: by mail-oi1-f181.google.com with SMTP id p129so9201484oig.3
 for <linux-cachefs@redhat.com>; Mon, 13 Jun 2022 13:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ie2xrfdugqSnUY/lUmZJBYqEw/Jj5HQgDROYZDI7Ljg=;
 b=C7HPq0BDaBXII9tvzyKBAQb1S5xaR2mOjmWKsp5f5t+nRV6H7v10myYTotQNUkwcXt
 1KYqTy01n0bEOFzUCHDwhoq1W1+/JbXCBuH3EjqOeo88LqB3xHhzLf9pbkPBuU7ZzQQo
 tuXFlTFPO4TCzC1+svT1vZlDaDvSqheWkQ1akuRlIjKLA41h0T8UlkHxi+vR7zTykDkP
 W7BaT/6K7xfRYsmwY4WhJRgig3yXLGTqcmJTGjbq1/eTGMjcGH9HEF09JcvcQO3qeVxT
 Sb1tIRNMY1BWWB2gStnTxTG8E9CyA41Ct6yLqkAC//u1jCsvwhoG2R5pjnwi8IdH4zhS
 zKcQ==
X-Gm-Message-State: AOAM533adhMY2pfpPfeN5cCNue8FVWIHOM0tAMN/5R/YXJcxXfo6tRbD
 f6p+lde6xcUm3jx6/y2fPdbGYw==
X-Google-Smtp-Source: ABdhPJxwqO943xteTGAgFieA/vZp5/Zn/6Qxyj5rF6Le0Sf8rKMQHGa/+OpWxWOapQGjDXa0MQVMLw==
X-Received: by 2002:a05:6808:2394:b0:326:d5d6:a4ba with SMTP id
 bp20-20020a056808239400b00326d5d6a4bamr321996oib.67.1655153561069; 
 Mon, 13 Jun 2022 13:52:41 -0700 (PDT)
Received: from [192.168.0.41] ([184.4.90.121])
 by smtp.gmail.com with ESMTPSA id
 dv8-20020a056870d88800b000f5eb6b409bsm4444747oab.45.2022.06.13.13.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:52:40 -0700 (PDT)
Message-ID: <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
Date: Mon, 13 Jun 2022 15:52:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
From: Frederick Lawler <fred@cloudflare.com>
In-Reply-To: <87tu8oze94.fsf@email.froward.int.ebiederm.org>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi Eric,

On 6/13/22 12:04 PM, Eric W. Biederman wrote:
> Frederick Lawler <fred@cloudflare.com> writes:
> 
>> While experimenting with the security_prepare_creds() LSM hook, we
>> noticed that our EPERM error code was not propagated up the callstack.
>> Instead ENOMEM is always returned.  As a result, some tools may send a
>> confusing error message to the user:
>>
>> $ unshare -rU
>> unshare: unshare failed: Cannot allocate memory
>>
>> A user would think that the system didn't have enough memory, when
>> instead the action was denied.
>>
>> This problem occurs because prepare_creds() and prepare_kernel_cred()
>> return NULL when security_prepare_creds() returns an error code. Later,
>> functions calling prepare_creds() and prepare_kernel_cred() return
>> ENOMEM because they assume that a NULL meant there was no memory
>> allocated.
>>
>> Fix this by propagating an error code from security_prepare_creds() up
>> the callstack.
> 
> Why would it make sense for security_prepare_creds to return an error
> code other than ENOMEM?
>  > That seems a bit of a violation of what that function is supposed to do
>

The API allows LSM authors to decide what error code is returned from 
the cred_prepare hook. security_task_alloc() is a similar hook, and has 
its return code propagated.

I'm proposing we follow security_task_allocs() pattern, and add 
visibility for failure cases in prepare_creds().

> I have probably missed a very interesting discussion where that was
> mentioned but I don't see link to the discussion or anything explaining
> why we want to do that in this change.
> 

AFAIK, this is the start of the discussion.

> Eric
> 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

