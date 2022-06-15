Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82D54CE66
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Jun 2022 18:18:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-DWFwzeM7NWyyDLWinNdXtA-1; Wed, 15 Jun 2022 12:18:33 -0400
X-MC-Unique: DWFwzeM7NWyyDLWinNdXtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D72FF85A586;
	Wed, 15 Jun 2022 16:18:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C74932166B26;
	Wed, 15 Jun 2022 16:18:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E7CA1947051;
	Wed, 15 Jun 2022 16:18:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BB1AB19466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 15 Jun 2022 15:55:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 767C22166B29; Wed, 15 Jun 2022 15:55:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71DCA2166B26
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 15:55:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56501800971
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 15:55:37 +0000 (UTC)
Received: from sonic316-26.consmr.mail.ne1.yahoo.com
 (sonic316-26.consmr.mail.ne1.yahoo.com [66.163.187.152]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-oEXy8SlhOlG-5BtezoFEyg-1; Wed, 15 Jun 2022 11:55:35 -0400
X-MC-Unique: oEXy8SlhOlG-5BtezoFEyg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1655308534; bh=DcasrK3Ao+uO7dv08ByHIA6gNyoX3cBO6RPIFwgZ0GF=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=P43cJCGEerBt9uDPLGhS6GCkC+nIVTHPXe+tIyjO6qKPnY5/WU7EGEGIXeUwU6JU+OHeJmY4TXkXC3uspiTga0itpEyHbiKd4ZFJ2Vfujw7i8yu29hKll7kjLzi+QVKkzawRd7/Wm3xhp7kdJQvfTwTsCJi+lC+ywSi48z0MuRmiw8GtVpeDgUDmQ0+jQPf6ePv1Oqf/ErM04mTnyrnEG5O0jPbhNwUQwrvMTOqwZR/9/lgxQ9iRkHx1pvCkzNJpOESpIc5nQ05jGwvQpxERCqn9z4Vhdn0y4ZldTxR6kxuGSGQVGOFeOB/HBiaL9JqlHT1zRhjcIiISATH+I2BP8Q==
X-YMail-OSG: 3.kxmMUVM1kALftCQOBOMDo0pwNt7N.gDwuaeG9n5J_gI6pT9kPEZctmfUZnpQN
 sj2P4HrPTnoRepKNiEiLv1xEV33fsgijjYcverCyhETE.8TeWydBXEmsKLdPjbs_x4u0ESMF7wio
 hzpfoJJadZ49RcVNHXe3XesQwRh.9Jr38oywKbpq.46hIucoXsGQmfBNEIDjXOo9bfNd5LqavkQ6
 ERdKJDJRqVfrfOO4_91Yobz3LnvShHzVtNCWTdeyyYtvpnWjjswG9zWLpLYoeU6ZOKTwtHFRLJfR
 W560sfptAJE.w918ny4Wa308w8e0lkCkAa6N1vxZNOSlms95DzcIgswYZxT..eC4VVnc6NbWaq_L
 Mr2bOHIryUCP.qo3oSGT7jrnNQ4Tv3OJDSlJZWcCz0LQEBGtGrkr5xegqgLtnoNXvCssr31GRozz
 gN005oHtmPy5eH1EZkTtx1M7Gz5.IKKMPCXZ5LGeJML5tRVy9AWQxp5lX_5CMlzFhyibPgUGi9LR
 BF8Vajr5yh97X6rzAOnIOckonNdkQyWRIuDSYixwQMP7XzdmrrYk79pIUgqB8H60B2FIvsjfKD5R
 l_IYZ_dZLMJ5dNmSs8.NcS1mV4GX7BdaodJXYZq1K4MD7EVFFJ04ybNSSwsTWV9j6YZKB85mxJar
 pXwRLvXQK8FzmSJ7Mb6Tq2z1.VtDYB1v2hOMducQQ12PP3mjWd2HYQvOgqBE7hCa5kqLSd8kQ7Bd
 M7i_GVuIQH9WSE_R9mSI89zHGMH24l6hc3Ig.b7i3R9Aht8Nci0BTeML5nOprafi6Fkb6z3VHIys
 sUAGHO55Y2h5Pe5mc4KOuN0G68IeGoGawKA.0d.UKiPMMdxe2ZuC0BWShlH5iZfWgQC1qNgVuJqe
 FgJFPYXe7y8HCkqklwZyGwhpe86OkSa390EyEFyCOHqOMlSth7XiOCUIdxI_mYT5h9VaCqrIZeoS
 t4w2NonhvVZI4tbV20Ytl5g.VVmjl1wjMqzj2xwGzrDYS5mAZ44M3H7tDBkZksnsoPdoz.x6x11G
 rvfiZixYchKYZsFUxOr3WO2UiOTMlJYd8yS4NC9eJ5hVWetnPoCa5EcCwwmBOTFkdLrDmAS0VhuD
 wqRPssrf4rJ7lJprdLziI5lZxEuV9AjEBx61CAzMhNvRVZJhI3wRENPpd6amAE3K53.HMjjwY5TA
 rhNb_m3KSlOcLK3WSeS.JUpjOBCHPfAgXLBdcvH0.LfmGVnLGlzAN.6cvffkeBHL9SDx_JQ6MZMv
 r32puXUCaqd2M6kAXstBWlsxNazPtWW0WyKEtD.A6epsaVeTXk6iNPLRxN5xCaXyZ1J.Yj71LPtS
 EmyHs0X3T7MSTgEUI5H92AY_ONrlBWnbSmdOk9d0AN2Pkrj7GPNw3bi0wzFPchsCqkUxejO2KlGN
 ReixQqwNpnhruPswKUHoxMojY75XYCJWrWz0Tphft_DsL529CGzKD7wnDgLktSfEVEzBCzJOq.2C
 FktretqsYCkfrAYwRPI2AFE02VsUoBGHeRKfv1ATxxyIyyP4wpNC2tucBriI3_vDnXEGdE75v3eQ
 z0DfJ1dF2t8Z8jhd1ApFFQaC4BsSPZIxWe9dC_lmeqUgGQGOMvcuFN7FlJ5lzasBpbP9yx8bhvXu
 cc1G6KZF7Ew.iGNU6esZnuAFrgr66dtw9P9b14qxTBwrOyJBzsq.ipPPSosa_TIJ4YHdIhdMo8N3
 Cw4j74AihIsCg150KpQ48QC4I0q_lY82cq3kDUKvA8B55OPjW5bKepKcxJWWpRiBXn9P.rgAzG7b
 ZagNnBMsfNfg5EV3u4P0rqgBMEia6cQLbQEUbScDEjB4KEN_kx4KlhzrIVc5fBgF18dxgUGpI1aY
 HFpQsYfPjGsLqVBvBc8LZl42At8Gt4m2YHVLBWCJPxC9TE0rfcwzPkWPevyy8kE7fNhP5lpQqANO
 Fefz4FKrLD2OwR6hDnnIWyb92ru22Hokk77jelyiRuZhgQ6DlUvuOZnalYISpjg7zyq9w6KMbtpg
 mg2EyBXe6vAPZgiolrQjFoXaCRvNLoPMLEhg2SzfePcMKcyiizbKKfnaZ5tk9ZRxWtf9M3UVt0Ds
 ypnw2Iw9X2ecIrwEl6iPTPbq9VvBKDelLNGr_6ujN6mjpV8U4Elb6132EdclVmcc5u5AuWz1lLWh
 WVGI.FR2LF4sAInFbD9lW9d4d4ZOhiGPbeNrNxuJNlui6AtUqMyGJfar3Ni2LZBvcnovcxzhj6Du
 woOHuP3sWOm5T2kRagJI8RBdazpZ4KmxpzyJdoS2CP99LADeT9FH3LKX1U4hhBGiDRO0.bKPzbfv
 RHnbGbCQ.eSw-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Wed, 15 Jun 2022 15:55:34 +0000
Received: by hermes--canary-production-ne1-799d7bd497-fg7z7 (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 75078b18cfc3ccad112c2b90a6626809; 
 Wed, 15 Jun 2022 15:55:31 +0000 (UTC)
Message-ID: <1c4b1c0d-12f6-6e9e-a6a3-cdce7418110c@schaufler-ca.com>
Date: Wed, 15 Jun 2022 08:55:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Paul Moore <paul@paul-moore.com>, Ignat Korchagin <ignat@cloudflare.com>
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
 <CAHC9VhRSzXeAZmBdNSAFEh=6XR57ecO7Ov+6BV9b0xVN1YR_Qw@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <CAHC9VhRSzXeAZmBdNSAFEh=6XR57ecO7Ov+6BV9b0xVN1YR_Qw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: linux-aio@kvack.org, linux-doc@vger.kernel.org, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-cifs@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>,
 Jeff Moyer <jmoyer@redhat.com>, linux-cachefs@redhat.com,
 Frederick Lawler <fred@cloudflare.com>, serge@hallyn.com,
 selinux@vger.kernel.org, linux-nfs@vger.kernel.org,
 Casey Schaufler <casey@schaufler-ca.com>,
 Christian Brauner <brauner@kernel.org>, netdev <netdev@vger.kernel.org>,
 samba-technical@lists.samba.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 6/15/2022 8:33 AM, Paul Moore wrote:
> On Wed, Jun 15, 2022 at 11:06 AM Ignat Korchagin <ignat@cloudflare.com> wrote:
>> On Wed, Jun 15, 2022 at 3:14 PM Paul Moore <paul@paul-moore.com> wrote:
>>> On Wed, Jun 15, 2022 at 6:30 AM Christian Brauner <brauner@kernel.org> wrote:
> ...
>
>>>> Fwiw, from this commit it wasn't very clear what you wanted to achieve
>>>> with this. It might be worth considering adding a new security hook for
>>>> this. Within msft it recently came up SELinux might have an interest in
>>>> something like this as well.
>>> Just to clarify things a bit, I believe SELinux would have an interest
>>> in a LSM hook capable of implementing an access control point for user
>>> namespaces regardless of Microsoft's current needs.  I suspect due to
>>> the security relevant nature of user namespaces most other LSMs would
>>> be interested as well; it seems like a well crafted hook would be
>>> welcome by most folks I think.
>> Just to get the full picture: is there actually a good reason not to
>> make this hook support this scenario? I understand it was not
>> originally intended for this, but it is well positioned in the code,
>> covers multiple subsystems (not only user namespaces), doesn't require
>> changing the LSM interface and it already does the job - just the
>> kernel internals need to respect the error code better. What bad
>> things can happen if we extend its use case to not only allocate
>> resources in LSMs?
> My concern is that the security_prepare_creds() hook, while only
> called from two different functions, ends up being called for a
> variety of different uses (look at the prepare_creds() and
> perpare_kernel_cred() callers) and I think it would be a challenge to
> identify the proper calling context in the LSM hook implementation
> given the current hook parameters.  One might be able to modify the
> hook to pass the necessary information, but I don't think that would
> be any cleaner than adding a userns specific hook.  I'm also guessing
> that the modified security_prepare_creds() hook implementations would
> also be more likely to encounter future maintenance issues as
> overriding credentials in the kernel seems only to be increasing, and
> each future caller would risk using the modified hook wrong by passing
> the wrong context and triggering the wrong behavior in the LSM.

We don't usually have hooks that do both attribute management and
access control. Some people seem excessively concerned about "cluttering"
calling code with security_something() instances, but for the most
part I think we're past that. I agree that making security_prepare_creds()
multi-purpose is a bad idea. Shared cred management isn't simple, and
adding access checks there is only going to make it worse.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

