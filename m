Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B071708C
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 May 2023 00:15:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685484912;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A2XhX8UtVBC1eJIgNRzb6pT9MjWINFyNpcDH7B9YeGA=;
	b=icWntHDka12ys+jAtHIRtDVyjOJbbUWvT7t/kRYUZTHvIAIxE5SW3qNOm6Es7FQlPveFHX
	+NzJtYf29x7YhLEdRHK3YNhWUTut8tewkUO8UKtX2McbtxuIGJXjIuto0iFXZtxJYUsCqU
	/qo2b8MgP5jnilTlyjyW6MoNVvyumuI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-Rj3e45LtP8OnLOkjylKY0Q-1; Tue, 30 May 2023 18:15:09 -0400
X-MC-Unique: Rj3e45LtP8OnLOkjylKY0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC9AD29AB40E;
	Tue, 30 May 2023 22:15:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46A6E20296C6;
	Tue, 30 May 2023 22:15:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ED9EB19465A8;
	Tue, 30 May 2023 22:15:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B9A6B1946595 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 30 May 2023 22:15:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1E0B20296C8; Tue, 30 May 2023 22:15:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A55020296C6
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 22:15:07 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A84D85A5A8
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 22:15:07 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
 (sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-S8NchEvVPNC4yEbkQqpS6w-1; Tue,
 30 May 2023 18:15:05 -0400
X-MC-Unique: S8NchEvVPNC4yEbkQqpS6w-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1685484904; bh=m0jBu7FnGohxkywaH5HxFqRVtflv1AvAFXS5FKj94tB=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=YW1yw87eMdxYt7xVagzMMwO9Ck61Bvf+ZwSjwkNbYTPksq1GqeF+Ik00V5QnkruTX4ohC/s/mL0Y6hukSQz5C1xJv/NZADv1xFGkGYyGGog8PKsmvPqy67PsnAV5JS8ec9GSykj8upsoz8ZWHSBLbts2sPtiMVns+PxhGZdoGhLq96mDa6/Y2hnjh6UfWV8UlbuY6TaXVZCVz3Wcl9BWtrydoy1EEQ0jSQcY6zOL//+HfzTtTe2raX0l7dZGEZoQZztTXoRWCFkYVIaWrf5AUNFAkW3pXAcKznbsBD8Cqtal4bZv8MxR5Y6IDK83/a13aSq9u0JLhOGJP06zHXiPCw==
X-YMail-OSG: mTax22kVM1l16k5yT7pC2O1bT4Z6PuhpbmB8RLu9eYr1eAx5w4CepGMevYtViQg
 1NVrcKYjD40By2_iwk4qEL0I44cFzcDiJ1IdRjx2wULGtafs9IbAqA1LVWB9CiR5_FwQhOJcGz.w
 s66WMN16KIqI_cfbUU_gykZKC0zOtIYT1FezQX2z4iCe3tKgeUHb8qfcTjIW7IvH9JMmysXNf..P
 lu9UxvTrE22QQsA43FBPa1tNqgmuyvVsHQtZ9GJhTonPQ6qm90x46IwzY6o5rjqaM1feiEw0wu8y
 1MNdmHquMfaMXDjOw_D3NL2dJbLg_YoCufADzIJ4qowXXuA9EMYnX9L31_z.iU15DdYKSAuR8cso
 pizv22WfWNLXPxNWo1mfa2cWAUyrUsH9euDP_81zt2g2c6DEqJoukHC9XUREIRLxWbXEmDYR0RAB
 EBC3IurpARJyfv9eCUNyW_RULkz_4wgarruvxtrARZu7gyKsKKeS3nBnP183_RCdlZPVqNXefpxd
 l7S8NO2Rehw491cSJfPC9t70HFgp3dIcurlISD_nwE657CVCFT_AxuxWiN2ozhE8sfsQrnpEQ7Jo
 1sAzSGaATyvOqS0bxgP29o.GOWfmRVTemzwIBsuEOFUFhulIzMLD6Qcg70spbfzazUebeLbnWoXW
 7o3chrir6Ah_1JQFKaUm5LwmdqHbNyYR_NPXJ9WdVsuPZyHmZLi9X1FjyykP_K3Y7M4mupwMZjPy
 5ZlPY66kv566GPsRzRiSV5d8YT3GxXLxbRyLNRCQZrG89Ish8F.FONRHg6xNZc_vwhaNV1GmWZGj
 XMisrbrfjrf7iA1MoYd0QnxFuOomtvoouLblsCFa1eAtdaOxeYlPG0Lc54MhRSwNeQXd2zMzk3RX
 kB1FBasA4TTEn8Yvsf5Rhl9EU08DeUzj4lRBZbwbMgwWXeaZAgTcqBXIy8W4.6D.NjtWnzluGRVX
 KO35LgREbTandq4Zdk2VjOQNs25sgULtmLyG.B2xN8tsKcs58H9eWVOIozD7uali9PBvH2MGDGjC
 rYFz7NP.Ha.VRpyVI8XAt8umovdFzgXaHkJI7LWKkxRiHU44Zce6btrJyVeqApGapTbOEsZJoe47
 C7vNvI4Pf9ZCjfNB9xR7HkbG86HLMnpPRTestKxTTk3iZBUVOKPDWFmXQ7LjTtFeNNJq3Kw1kLpv
 sX3iI7g.aw_7BYTPmQFI63giMlfSOy0widgBEdyEVVGkjWaUE2HB7DNg6ku0J6dVn_hAJ.U4kRIj
 L4og1Ov1dUlGLsdHlxRSlSe_LmBCfVRHoSXqDSyQ.6joQMx5FB1J3NB3TSrCn_VKhm_ORp1AcUqu
 laUywqvqKtet_nw1WV4jBen_j4pH_K80.FfNob25EsY6I9VtMe7i_XM41v76oWFe1nGgVgYjdZsj
 veNYcMMZziPZxqk3slODtHqbg056hlXo57rmSb_NxrYa6LX73JKjRHbtIcyaz12PY05UxdIkX601
 bCZ9BrYmOyyMkhVONyXH0Sn2sQeis5PV1IZxRWTp2ssHvpXlz4eT3Vv4Fpb8nTsM_XkRnkDTc430
 cmVr9wYJcJbldHEHar9fx0ROYctdKu6m9_2QCxNUUH1qgLNe2RKrbAOz_XywcCih4Fx99jcUy8KO
 xgqlZT3tZmRzhD1BrF5wANG3Cgls3JZn1ezGBmB3XC_nlUW9KR5i72ffd3MR6BUmmgCXVLJ0PFyz
 paRXtpb0CG8.8jwcZRD366A5J9PKWL19vfMbFD8ITM6u_96sPARzk3qBKqjYN_CXrnM9Xlxo4M77
 zIuj4SOPF2MR4KVpJ6qEAyZuuHyFAOm0fHh_vyHa7qd.kGUVSEHwPTIoJzuT6Mcq3f6hKfJy0fSD
 IoQHvl7zOQDDhyh.Kd4VRA0XX11POQB6K4M0bwxI6.aphWpPRX.PXCQYC4cK8.8ZWWZ3nIosmRyB
 KY3346NGo3Po5yqHuX4iKPsx0AFCpk_b41TAY8c86sqGEKCh23ltzNTKPLFE.bQIzvbJTcxxTJ0c
 qyCxym_AovTWVj6GHVlEo.R6bNOfiBPqfdYwodK5ftHnCS7RGiYnrxy8LspLwawfHz1931HTY949
 V48FA66D_KV0CVbupsPmtD43672ZXelDWFBeEYsysy.gOrzSsTKGeu0aE4ZCVO_s2axLLut5iWrP
 .xcuxKstHOQ_KiM.qsUDaTsg6y89q1j1q_FhCjgzWxvWIYM.UwUWsS9oNmznBzAq5bX2NatBn.nt
 joOWZcwUu8y2Of57kAhk_rbTIU9Xo_QFX
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: ec3c0326-5610-4751-b411-bab55e7c81bd
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 30 May 2023 22:15:04 +0000
Received: by hermes--production-gq1-6db989bfb-4sk72 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3afa87517718980d01f16661ce4f0e8a; 
 Tue, 30 May 2023 22:15:03 +0000 (UTC)
Message-ID: <28f3ca55-29ea-4582-655d-2769881127ad@schaufler-ca.com>
Date: Tue, 30 May 2023 15:15:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Christian Brauner <brauner@kernel.org>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
 <20230530142826.GA9376@lst.de>
 <301a58de-e03f-02fd-57c5-1267876eb2df@schaufler-ca.com>
 <20230530-tumult-adrenalin-8d48cb35d506@brauner>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20230530-tumult-adrenalin-8d48cb35d506@brauner>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH -next 0/2] lsm: Change inode_setattr()
 to take struct
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
Cc: mortonm@chromium.org, rafael@kernel.org, roberto.sassu@huawei.com,
 linux-unionfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-cifs@vger.kernel.org, paul@paul-moore.com, miklos@szeredi.hu,
 mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, tom@talpey.com,
 Casey Schaufler <casey@schaufler-ca.com>, wangweiyang2@huawei.com,
 viro@zeniv.linux.org.uk, dchinner@redhat.com,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, eparis@parisplace.org,
 hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com, linux-nfs@vger.kernel.org,
 john.johansen@canonical.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: schaufler-ca.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/30/2023 9:01 AM, Christian Brauner wrote:
> On Tue, May 30, 2023 at 07:55:17AM -0700, Casey Schaufler wrote:
>> On 5/30/2023 7:28 AM, Christoph Hellwig wrote:
>>> On Tue, May 30, 2023 at 03:58:35PM +0200, Christian Brauner wrote:
>>>> The main concern which was expressed on other patchsets before is that
>>>> modifying inode operations to take struct path is not the way to go.
>>>> Passing struct path into individual filesystems is a clear layering
>>>> violation for most inode operations, sometimes downright not feasible,
>>>> and in general exposing struct vfsmount to filesystems is a hard no. At
>>>> least as far as I'm concerned.
>>> Agreed.  Passing struct path into random places is not how the VFS works.
>>>
>>>> So the best way to achieve the landlock goal might be to add new hooks
>>> What is "the landlock goal", and why does it matter?
>>>
>>>> or not. And we keep adding new LSMs without deprecating older ones (A
>>>> problem we also face in the fs layer.) and then they sit around but
>>>> still need to be taken into account when doing changes.
>>> Yes, I'm really worried about th amount of LSMs we have, and the weird
>>> things they do.
>> Which LSM(s) do you think ought to be deprecated? I only see one that I
> I don't have a good insight into what LSMs are actively used or are
> effectively unused but I would be curious to hear what LSMs are
> considered actively used/maintained from the LSM maintainer's
> perspective.

I'm not the LSM maintainer, but I've been working on the infrastructure
for quite some time. All the existing LSMs save one can readily be associated
with active systems, and the one that isn't is actively maintained. We have
not gotten into the habit of accepting LSMs upstream that don't have a real
world use.

>> might consider a candidate. As for weird behavior, that's what LSMs are
>> for, and the really weird ones proposed (e.g. pathname character set limitations)
> If this is effectively saying that LSMs are licensed to step outside the
> rules of the subsystem they're a guest in then it seems unlikely
> subsystems will be very excited to let new LSM changes go in important
> codepaths going forward. In fact this seems like a good argument against
> it.

This is an artifact of Linus' decision that security models should be
supported as add-on modules. On the one hand, all that a subsystem maintainer
needs to know about a security feature is what it needs in the way of hooks.
On the other hand, the subsystem maintainer loses control over what kinds of
things the security feature does with the available information. It's a
tension that we've had to deal with since the Orange Book days of the late
1980's. The deal has always been:

	You can have your security feature if:
	1. If I turn it off it has no performance impact
	2. I don't have to do anything to maintain it
	3. It doesn't interfere with any other system behavior
	4. You'll leave me alone

As a security developer from way back I would be delighted if maintainers of
other subsystems took an active interest in some of what we've been trying
to accomplish in the security space. If the VFS maintainers would like to
see the LSM interfaces for file systems changed I, for one, would like very
much to hear about what they'd prefer. 

We do a lot of crazy things to avoid interfering with the subsystems we
interact with. A closer developer relationship would be most welcome, so
long as it helps us achieve or goals. We get a lot of complaints about how
LSM feature perform, but no one wants to hear that a good deal of that comes
about because of what has to be done in support of 1, 2 and 3 above. Sometimes
we do stoopid things, but usually it's to avoid changes "outside our swim lane".

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

