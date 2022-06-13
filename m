Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8554857E
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jun 2022 15:47:04 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-OKs4y2nQOqCWpv916I3N1g-1; Mon, 13 Jun 2022 09:47:00 -0400
X-MC-Unique: OKs4y2nQOqCWpv916I3N1g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04E3F380670E;
	Mon, 13 Jun 2022 13:47:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A971492CA2;
	Mon, 13 Jun 2022 13:46:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A76731947067;
	Mon, 13 Jun 2022 13:46:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A1360194705B for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 13 Jun 2022 13:46:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 13998112131E; Mon, 13 Jun 2022 13:46:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F4AB1121319
 for <linux-cachefs@redhat.com>; Mon, 13 Jun 2022 13:46:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E657C804181
 for <linux-cachefs@redhat.com>; Mon, 13 Jun 2022 13:46:55 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-aFbi4HY0OWmicm6F9dqdiw-1; Mon, 13 Jun 2022 09:46:52 -0400
X-MC-Unique: aFbi4HY0OWmicm6F9dqdiw-1
Received: by mail-oi1-f179.google.com with SMTP id y69so7773305oia.7
 for <linux-cachefs@redhat.com>; Mon, 13 Jun 2022 06:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F8034aqgQYOIDnTJYbKnqdxe/P3NxT2RcNrYib0/ruQ=;
 b=TSy5mBradMGZ81Yg3/fFTpqAcUksTn7NLiINPy0aPG1CDJJtB/z6e8Pe1Tqs6UmEyW
 mVy6i+m+tJYpxqeTHkmqEcK0NSMhlEMCmTHIeGlHAE5LuAGOAr0n5LfjQ31uIDRR2kDF
 EU1fbCfPKTFuUC54SL455UoPgO0nBreA9MXso+3PLhAruzqheOPghj75H4xs+e2gf6GR
 rARqulhJ9mUe/vsHuYWcAqQww1fxEI515l9q06MOGdnT+Vk3kB380xSMEnPMKV3sZLRy
 ergfBLR6dHP6ax8f2EY0n7vW9Piy6+6FaIB8rbapUoS/9JYUo8bsbLEAuE5/Y9Zx9YHZ
 6KcA==
X-Gm-Message-State: AOAM530Jxlv4PNG0cKKJMX9Hp/dS4hRYkvpex/LBsztq9b5Aip7oPVTQ
 txFUv+071Z8usJuoRe4WKcAVlQ==
X-Google-Smtp-Source: ABdhPJxMf2Qm5H8GA35Xq5n+x+nRvAKUAEETko5C92sldqd/ieCBtB6EHAADbYtdN68bTfZpGjw0Ow==
X-Received: by 2002:aca:b744:0:b0:32f:4c19:cec1 with SMTP id
 h65-20020acab744000000b0032f4c19cec1mr1696209oif.43.1655128012170; 
 Mon, 13 Jun 2022 06:46:52 -0700 (PDT)
Received: from [192.168.0.41] ([184.4.90.121])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a4ad494000000b0035eb4e5a6b5sm3699171oos.11.2022.06.13.06.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 06:46:51 -0700 (PDT)
Message-ID: <b4113083-73de-3ab6-e23f-32c6627d177e@cloudflare.com>
Date: Mon, 13 Jun 2022 08:46:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Eric Biggers <ebiggers@kernel.org>
References: <20220608150942.776446-1-fred@cloudflare.com>
 <YqJ/0W3wxPThWqgC@sol.localdomain>
From: Frederick Lawler <fred@cloudflare.com>
In-Reply-To: <YqJ/0W3wxPThWqgC@sol.localdomain>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi Eric,

On 6/9/22 6:18 PM, Eric Biggers wrote:
> On Wed, Jun 08, 2022 at 10:09:42AM -0500, Frederick Lawler wrote:
>> diff --git a/fs/aio.c b/fs/aio.c
>> index 3c249b938632..5abbe88c3ca7 100644
>> --- a/fs/aio.c
>> +++ b/fs/aio.c
>> @@ -1620,6 +1620,8 @@ static void aio_fsync_work(struct work_struct *work)
>>   static int aio_fsync(struct fsync_iocb *req, const struct iocb *iocb,
>>   		     bool datasync)
>>   {
>> +	int err;
>> +
>>   	if (unlikely(iocb->aio_buf || iocb->aio_offset || iocb->aio_nbytes ||
>>   			iocb->aio_rw_flags))
>>   		return -EINVAL;
>> @@ -1628,8 +1630,11 @@ static int aio_fsync(struct fsync_iocb *req, const struct iocb *iocb,
>>   		return -EINVAL;
>>   
>>   	req->creds = prepare_creds();
>> -	if (!req->creds)
>> -		return -ENOMEM;
>> +	if (IS_ERR(req->creds)) {
>> +		err = PTR_ERR(req->creds);
>> +		req->creds = NULL;
>> +		return err;
>> +	}
> 
> This part is a little ugly.  How about doing:
> 
> 	creds = prepare_creds();
> 	if (IS_ERR(creds))
> 		return PTR_ERR(creds);
> 	req->creds = creds;
> 

I can do that, and same for below.

>> diff --git a/fs/exec.c b/fs/exec.c
>> index 0989fb8472a1..02624783e40e 100644
>> --- a/fs/exec.c
>> +++ b/fs/exec.c
>> @@ -1468,15 +1468,19 @@ EXPORT_SYMBOL(finalize_exec);
>>    */
>>   static int prepare_bprm_creds(struct linux_binprm *bprm)
>>   {
>> +	int err = -ERESTARTNOINTR;
>>   	if (mutex_lock_interruptible(&current->signal->cred_guard_mutex))
>> -		return -ERESTARTNOINTR;
>> +		return err;
>>   
>>   	bprm->cred = prepare_exec_creds();
>> -	if (likely(bprm->cred))
>> -		return 0;
>> +	if (IS_ERR(bprm->cred)) {
>> +		err = PTR_ERR(bprm->cred);
>> +		bprm->cred = NULL;
>> +		mutex_unlock(&current->signal->cred_guard_mutex);
>> +		return err;
>> +	}
>>   
>> -	mutex_unlock(&current->signal->cred_guard_mutex);
>> -	return -ENOMEM;
>> +	return 0;
>>   }
> 
> Similarly:
> 
> static int prepare_bprm_creds(struct linux_binprm *bprm)
> {
> 	struct cred *cred;
> 
> 	if (mutex_lock_interruptible(&current->signal->cred_guard_mutex))
> 		return -ERESTARTNOINTR;
> 
> 	cred = prepare_exec_creds();
> 	if (IS_ERR(cred)) {
> 		mutex_unlock(&current->signal->cred_guard_mutex);
> 		return PTR_ERR(cred);
> 	}
> 	bprm->cred = cred;
> 	return 0;
> }
> 
>> diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
>> index eec72ca962e2..6cf75aa83b6c 100644
>> --- a/kernel/nsproxy.c
>> +++ b/kernel/nsproxy.c
>> @@ -311,6 +311,7 @@ static void put_nsset(struct nsset *nsset)
>>   
>>   static int prepare_nsset(unsigned flags, struct nsset *nsset)
>>   {
>> +	int err = -ENOMEM;
>>   	struct task_struct *me = current;
>>   
>>   	nsset->nsproxy = create_new_namespaces(0, me, current_user_ns(), me->fs);
>> @@ -324,6 +325,12 @@ static int prepare_nsset(unsigned flags, struct nsset *nsset)
>>   	if (!nsset->cred)
>>   		goto out;
>>   
>> +	if (IS_ERR(nsset->cred)) {
>> +		err = PTR_ERR(nsset->cred);
>> +		nsset->cred = NULL;
>> +		goto out;
>> +	}
> 
> Why is the NULL check above being kept?
> 

In the branch prior:

	if (flags & CLONE_NEWUSER) {
		nsset->cred = prepare_creds();
	else
		nsset->cred = current_cred();

I don't see cases where others are checking for null after 
current_cred(), therefore I can remove that check.

> Also, drivers/crypto/ccp/sev-dev.c needs to be updated.
> 

Nice catch! I clearly missed addition after the merge window.

> - Eric

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

