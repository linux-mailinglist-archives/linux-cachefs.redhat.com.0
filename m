Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B0854B36A
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Jun 2022 16:39:39 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-j5BdoIl5OxSQaeAI1e6hQw-1; Tue, 14 Jun 2022 10:39:35 -0400
X-MC-Unique: j5BdoIl5OxSQaeAI1e6hQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E30E238173C5;
	Tue, 14 Jun 2022 14:39:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7ECDF1415103;
	Tue, 14 Jun 2022 14:39:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3972D1947076;
	Tue, 14 Jun 2022 14:39:33 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 279421947067 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 14:39:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 020FCC27E97; Tue, 14 Jun 2022 14:39:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1FB6C28118
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 14:39:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C797829AA2E7
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 14:39:31 +0000 (UTC)
Received: from sonic316-26.consmr.mail.ne1.yahoo.com
 (sonic316-26.consmr.mail.ne1.yahoo.com [66.163.187.152]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-NqVEpIZHNFaH2JkowAvMHw-1; Tue, 14 Jun 2022 10:39:29 -0400
X-MC-Unique: NqVEpIZHNFaH2JkowAvMHw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1655217569; bh=lRUBSB76OG5uRwjsyAtEUmfLb2iPR7sDD1HFxFWV66b=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=Qf8RR/99yPxdxlUs+k9WbY66HCWw5zL3eg/AG/d8PaF2ZW7sRQsWq6gmO9A/l7NZTWI7UdRqKM5bDHbs6wupQkeVNnPnRU2E5aJ02Zk+dMR4zD7/s5cNknCyMX/GityW/LiHFvSd/XM7aartsEujYu09UY1GhHeq1D712AxFIJsY8aK/OlILZVF6egzn6sq8A7407LfIYkuACSJL8g1M/mmbhUgbiOsQ+CYK1mUY0RpwWvYX8gqa2sPB3WEOxqty1MukDjP2FW6rxr1jRuQBeQgVCqktKQ2g163zpXEobbQtJYRhHhj9nK4BnkDO+kDP4JBwDWeJ+g1U93EjktSC1Q==
X-YMail-OSG: l34EP_4VM1mCZNS.V_eCLpRm9dh5I1CsXixH4kuccuVcaljnubvC2j4A6MMQ129
 Y2Pi1pBZKWkGXaXj27i38I8ExPjiKP1Xgpcl4tm9xqnMiwV4KKbA3RIP0pHjrVRzdj7MRxTx9iBG
 YkdEQiInROMc3joMrXGCf9wmezHz6P8mJ.fFwD3SDeBlElgidwY8jLECc4hnW5TJm2DZ.k.jf483
 xuskZUVuBZ_.7nYZM3Q6oMDqD16BRAXdGDrt0RJ_foeLdgA5bonrmkWFCR3gASY_oflWZvXQixlq
 UF1m.qP9YXbSsWZFj812VhzLVpyQ.9F32n9h1HmEh69jx_hRtAaRIdgwaAfngbVWVJSKavMjVMfQ
 XSXz0eYuXsWCwdfhD196BTPVVtMbrJkHzY6Xk9iE5UHCsUBamqZuh8ubo3QILsuwtLsCNFKyzrlY
 vF4UN_H53gUTXszFFk2yLOyY55uNmgcqWwzFBPIfnM150R3f0Jfb8fh5Mzo_Cg0qaQvSchBKjCXj
 nTjHJJOq.fI2fCTCBN3A870QDzGDAkOKrM.MsNpsLweC7IaQy.BbmtdwUXg3AQDgxaX8sTWqySH_
 YK5rjqHBdeevCU9nZl2LemqBf.vLuvTdVi3q0_6s36rQkUJeC8EDY4s_ity57vDuikZT8YgGAV2k
 GQo4ZHWmnm4lDk7xTd50gp0t_DJ.Hafgjqy64gvtibxS1SHL0D9MqZg76zZNAcQl5zu0Exhv4OcW
 mDH5_kPytoYBvgcpDzUXj5OtiUT.rs03EresI6Qrd1muzCGUw99JUhwVKK40RSvSZXMM815o3TH6
 fIwQnXzwajujE9szKg5ZCG.oh8QawNsxRxn.qck.uP4fzRlaBP9DE545T2hkZSFslMoNmyD9YjDu
 DPyG49HGFuxQy6RMUV5D6tgRq2Jopfx_d.mJpEqNoUiuIWnKil4PEXFovbbhpvuyUhOL3VE2GmDX
 VDBVqCAZbiZhRu7UKrQLPpAf4FtH9tiEdWyHvyrkqbXg__AQJ_N3sxY4nnv6lAtDCk3xv8g4zA7q
 br.dMb13NA4a2TtcCtBHvVIzzWlvGv4U9JfN73FVEuv77CejNVNcPQ8XO0e3i2_eBbyDtuzTowpF
 r7tocTWs53b.gwK4kDv_pTqO0hkqXLBV9X.I0Z6r8V3u504t5eb2cOQisOd4Mhos8dnXyaAN9cvu
 7acgLpOpZcWqyW9UMNNm1ShkpPPdBQprBadtvMrLPJFHbWwRyzdUL1sXWTpogylt3tdIon.0FUKm
 rYQHTIZKXN0FbJz4FKuZgtnj76nzxXdow3yqiqKvKnjZ5MSJnwK0MtpYhCeyLNxltgJfN4K5iM2N
 7_UXaTuwcmiKL82RDIrVJ_m4tLhQSD0TMdB.C2.RuC3DLR6EZjR8icmJ5Pcyp1FBSAS.nzoMlvyG
 wQetEXAUX6UnRnxz4Y.joRItG62ICV6zPRT7DkNFqhLrhD49oEyY7OTpUAHfUzW96T3TjU.z.xtX
 BRJ59.VxAXDse4eqIhZpOo67ruAxITzCz2bwWgj9_3BVGoKrKa2hdF1EbK_wrXYCphFhgdP591BM
 8Dx4nw.OvDUtcFSmwaX38z91xvkNg2gGzURgEg.1aIahIoxGy.8HwC2Lo.9sDMjQ0LoYEOVKAezC
 pGYewkGVTBsGHmpazBNDJ2yGdk1YnZ2RsxVQ6cVhAQ9oSC.UcB_QDBHfOgxJ0tQNNGx1hsc2BMQ7
 fEPpEXJ8GKjioBsLIWpvl67R9boFpyk8B0YFa.DQk0VZ10896guGPPSX8tQw0bHPw998u2wOlfFK
 r4iYVN6y2wwWwSC6Fp.DmjY5e6rtZVgjns0R9CrneHrhI2xoZjTxHqHrwpBEtqFrzK3GFPPTQtAK
 8hT6WRqTR8iJ_lz5fcEMBfDgXpLb2mzq7IppLiwFTDPN0ML7c0cKS8RDnYr0QMe9gdGZvRZcaZ81
 oYqSjE5Ttah8mMWG6l3Obhj.YZXwg55XNndIG65ct.wK5BmQd6aYUN9KcjQYh._prdA3e2KLlb8V
 tqRYdouhudJUpS29Eru77mKyHJcKeNct9WUI81o1XVVm1AGD8KRjrhBrE7_R.Nf_EiTNWlcVA8hx
 BP.uDsYOJpVvf8mbQloJ5acD1I.TpGP2NfRbjr1FwYfk8z6l8gQUDe39HzYrWKeDUt_IRlNJ7_gD
 KwvB64DCfDs5Yr2pbiRmfb0WwIP2scfxv4AA1X3gcjY0nFjSemkRJmqKpJEA2xu5VIOqoZ9kt3Fy
 lGpmYgJNyn592qSxpIAHi28oenfQQFZhXz4JO5sR.3hWwhS2Z
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Tue, 14 Jun 2022 14:39:29 +0000
Received: by hermes--canary-production-bf1-856dbf94db-nwd6f (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 047d13c43786ba81a547ff9186866ac4; 
 Tue, 14 Jun 2022 14:39:27 +0000 (UTC)
Message-ID: <b9d27b14-3b45-470d-9c7b-c6f7fb0ca8a5@schaufler-ca.com>
Date: Tue, 14 Jun 2022 07:39:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Frederick Lawler <fred@cloudflare.com>
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
 <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
 Casey Schaufler <casey@schaufler-ca.com>, kernel-team@cloudflare.com,
 serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 6/13/2022 9:44 PM, Eric W. Biederman wrote:
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
>> The API allows LSM authors to decide what error code is returned from the
>> cred_prepare hook. security_task_alloc() is a similar hook, and has its return
>> code propagated.
> It is not an api.  It is an implementation detail of the linux kernel.
> It is a set of convenient functions that do a job.

Yeah, sort of. We still don't want to change it willy-nilly as it
has multiple users from both ends.

>
> The general rule is we don't support cases without an in-tree user.  I
> don't see an in-tree user.

Unfortunately, the BPF security module allows arbitrary out-of-tree programs
in any hook. While returns other than -ENOMEM may be nonsensical, they are
possible. This is driving the LSM infrastructure in the direction of being
an API, in that users of BPF need to know what they are allowed to do in
their hook programs.

> I'm proposing we follow security_task_allocs() pattern, and add visibility for
> failure cases in prepare_creds().
> I am asking why we would want to.  Especially as it is not an API, and I
> don't see any good reason for anything but an -ENOMEM failure to be
> supported.
>
> Without an in-tree user that cares it is probably better to go the
> opposite direction and remove the possibility of return anything but
> memory allocation failure.  That will make it clearer to implementors
> that a general error code is not supported and this is not a location
> to implement policy, this is only a hook to allocate state for the LSM.

The more clearly we define how a function is to be used the more it looks
like an API. The LSM security_ interfaces are not well designed. They have
appeared, changed and disappeared organically. This was fine when there was
one user and tolerable when there were a few, but is getting to be painful
as the number of security modules increases and their assumptions and
behavior diverges from subject/object mandatory access control.


>>> I have probably missed a very interesting discussion where that was
>>> mentioned but I don't see link to the discussion or anything explaining
>>> why we want to do that in this change.
>>>
>> AFAIK, this is the start of the discussion.
> You were on v3 and had an out of tree piece of code so I assumed someone
> had at least thought about why you want to implement policy in a piece
> of code whose only purpose is to allocate memory to store state.

I agree with both sides to some extent. The caller shouldn't assume that
the only possible error is -ENOMEM, but the LSM hook should never do anything
else, either. If there is a legitimate case where an different error may
be returned and a reasonable, different action the caller(s) would take in
that case, the change makes sense. Otherwise, no.

> Eric
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

