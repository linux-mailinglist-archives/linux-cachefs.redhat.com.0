Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D14EBD68
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Mar 2022 11:14:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-VLnWgTLpOfS5kgL9AV-fcw-1; Wed, 30 Mar 2022 05:14:43 -0400
X-MC-Unique: VLnWgTLpOfS5kgL9AV-fcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BDA410115FB;
	Wed, 30 Mar 2022 09:14:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05D43400E132;
	Wed, 30 Mar 2022 09:14:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BC17D1947BBC;
	Wed, 30 Mar 2022 09:14:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 517CC19466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 30 Mar 2022 09:14:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 435F0400E43D; Wed, 30 Mar 2022 09:14:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F890400E132
 for <linux-cachefs@redhat.com>; Wed, 30 Mar 2022 09:14:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27E851011637
 for <linux-cachefs@redhat.com>; Wed, 30 Mar 2022 09:14:42 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-_Fwxc1SKMAO4jBEEkoZR-Q-1; Wed, 30 Mar 2022 05:14:39 -0400
X-MC-Unique: _Fwxc1SKMAO4jBEEkoZR-Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V8d4DCn_1648631675
Received: from 30.225.24.55(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8d4DCn_1648631675) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 30 Mar 2022 17:14:35 +0800
Message-ID: <318a786a-0a27-15c6-6de1-66dd25210528@linux.alibaba.com>
Date: Wed, 30 Mar 2022 17:14:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <20220330045446.128455-1-jefflexu@linux.alibaba.com>
 <2917164.1648630296@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <2917164.1648630296@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: revert inode in use in
 error path
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/30/22 4:51 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> Subject: [PATCH] cachefiles: revert inode in use in error path
> 
> Can you say "Unmark" rather than "revert"?  I would tend to reserve the word
> "revert" for when I'm reverting a commit.

OK.

> 
>> @@ -494,15 +502,20 @@ struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
>> ...
>> +out_unuse:
>> +	cachefiles_do_unmark_inode_in_use(object, path.dentry);
> 
> It shouldn't matter here.  We're dealing with a tmpfile, so we shouldn't ever
> see it again.  If we do, it's a bug in the backing filesystem.  OTOH, I
> suppose it makes sense to clear it anyway.

Right. Only cachefiles_open_file() will trigger "Inode already in use"
warning.

> 
>> @@ -574,8 +587,16 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
>>  	_debug("file -> %pd positive", dentry);
>>  
>>  	ret = cachefiles_check_auxdata(object, file);
>> -	if (ret < 0)
>> -		goto check_failed;
>> +	if (ret < 0) {
>> +		fscache_cookie_lookup_negative(object->cookie);
>> +		cachefiles_unmark_inode_in_use(object, file);
>> +		fput(file);
>> +		dput(dentry);
>> +
>> +		if (ret == -ESTALE)
>> +			return cachefiles_create_file(object);
>> +		return false;
>> +	}
>>  
>>  	object->file = file;
>>  
>> @@ -587,17 +608,10 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
>>  	dput(dentry);
>>  	return true;
>>  
>> -check_failed:
>> -	fscache_cookie_lookup_negative(object->cookie);
>> -	cachefiles_unmark_inode_in_use(object, file);
>> -	if (ret == -ESTALE) {
>> -		fput(file);
>> -		dput(dentry);
>> -		return cachefiles_create_file(object);
>> -	}
>>  error_fput:
>>  	fput(file);
>>  error:
>> +	cachefiles_do_unmark_inode_in_use(object, dentry);
>>  	dput(dentry);
>>  	return false;
>>  }
> 
> Okay, you are correct here, but could you leave the "check_failed:" label
> where it is and make your rearrangements there?  That way the error handling
> is outside the main path through the function.

OK.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

