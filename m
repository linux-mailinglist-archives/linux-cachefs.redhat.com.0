Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6F718504
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 May 2023 16:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685543511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JfUCGupW2Id5IeWqOJ1rYMgqGiRP1Iw58gcqibK4Rpk=;
	b=aAJ/Iok3j9cNKeIiJ/Xd0DCUvRwRzLHNCnoO1fNlKSrhBQj71uPUASmvJy2+UVEXksKZTj
	rK/S2A4mG3wYkSRPHqDpMwUOYWRuoOE3aLfBAMMubTdx2kXHu1UtToZ6t69jyKO4BGSys3
	QEFaLEYhHennZdfq1PTzwQVKdPoV3rg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-OGudOC8XP_ioj3s0XYkZ3Q-1; Wed, 31 May 2023 10:31:48 -0400
X-MC-Unique: OGudOC8XP_ioj3s0XYkZ3Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87B673828895;
	Wed, 31 May 2023 14:31:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79AD8492B0A;
	Wed, 31 May 2023 14:31:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F32319465BD;
	Wed, 31 May 2023 14:31:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 970E81946595 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 May 2023 14:17:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 786C7420A8; Wed, 31 May 2023 14:17:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7076142AB8
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 14:17:17 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D2B4811E7F
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 14:17:17 +0000 (UTC)
Received: from sonic311-29.consmr.mail.ne1.yahoo.com
 (sonic311-29.consmr.mail.ne1.yahoo.com [66.163.188.210]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-eyGpAurUNtGN_v7VSAIyMQ-1; Wed,
 31 May 2023 10:17:15 -0400
X-MC-Unique: eyGpAurUNtGN_v7VSAIyMQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1685542634; bh=In52hxvGcGscBnK4YcfxGoJg05ahXzVDO4vWcIkg9zX=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=FZcoenma9wFmozb+7JbcPV2PcIO/+4pT7+0R3axAr1SRbtx7EI4JAlM/1BveGMIbY5/tsB7TSdMdDoPO635kk3pi4OH2yXPwQL9RGvoIBv+SGfINgAwDfdKoKx50N5kV0s0L2STPyKq7F7FzFebllYJEYJ3uo5NUAHsE2hEpixpnCq+vJOongrz1lr2O5immV+bFN2Bw03Q6hv43aBYMle/pRgjoqhWpfI6aO9u9sYPrvKq0k91adtMIH2cpfvckSuHxsStj/3CaZJ7acD5JASKu7FwJe6R4fuSCz+LDohr6Vir2j/LSuECeSdR73HaRKDE6jPOUDMmA2yQE5Vv4QA==
X-YMail-OSG: YS2OiOgVM1kmwmgmji0DUz5dLhGzTb5Z198M4.LCNKObOZhn4oZZvKSnFZmfrxY
 UN6hR2P.A3qTmfVVDLFNYjn5QLt.nWYU8UGVZqmdVBdYYliraQ4peiZ_mZcfzn3.A8K3FJVwas4G
 KCkturum0T2vml6moo5VB_FFFCpq9blIh4jyzDm553j1p2bCA71u8R6jlUzlpTIt_AfZPJNoCA__
 H0qDyP0SzecdXb8h5oqmF9l3hveY.Oscf_4EXTa6rBmRoFDSjkoq8QSewWZX3XufbrpnwqTtTVUw
 5P4lE4bm8YEuzhtOqPLNsFHy8ALL9jifaNIHQeYWomRilT54uVLHQBjcs2PUTQk9EBgGFm1Rmmdt
 B4KynaXuuw1_MkEUIlciCaFkiDKBTKzMlbGg2PyiNrmZEinAVHVh7PTVCsbfiMwSBRjXxhjqgdSt
 ukLyssbUujJcgQLRcitba21rG1jjuK3FNCDPagA7f.v1IE_d76aBghD7vp8dhcSs2aiicgjLXhtp
 0KsakzlYZyz0O0sTeXe_c2ac9GCL_AlpGd9TzKiouagsNT9CCDbgbIU.MKNYAOMcAo1l7PChe4iE
 zSTIZcZEnzmTx1Cwxy.VgFIeEXgxMD22KonFWwq1k8lyWC7isb9.8czYhGHqT4KuTjcg.fGOd.p5
 PcYFKBOQm0244ErDybsrwRrRoYWLFQcFq5ZM3_akYqobgfpsqw1KPRGneQQA8Nz3fja7n6GUbi.0
 sF3GEfazRl_OkzU9pLsL2tvFb2oo4cLKB9oLJQvfOMX5PVv6KquqCIGB9kQFvpCtGrDQpkhF9uwO
 zByidQDBEvSU.ktIviMPVxB1aqq5pcdpQkfsVS.cPz9SKVqFZQ661XuWjjPg9Kgp3e9M0POOl4R1
 rXvZJb_zS8HqbT.vWYysdJ5KhAGE6Iz5wlVivG2pXjXNGRJpLUOvz25viKevlGxdtO7j48C9FwUS
 bJG0rsEKsL62VVoxF4PuMPsAyFj9B5XdmQL_8uEABBVfXBEFeiB26z7FB0vJ0a3YZ_uSrDioHI9k
 nkQITYnz2FAAVrFLOcedWIc8xj4iPYDkkLJIqyno6KmWYiZQrQLAJWx4iOGKg72Fg2ihfubvT85r
 fbelkwhNU7S814bNZoeXzHHJKHNqpW.SVpzgloR_rWwPhwopW2hv5P4zcV3N_BNwZ7hVDUwn0TBZ
 TrnvLMAvHMzsjtYBAkpZE19ZH6b0R_qDTh95G_nF7DgX7oBkCp0lgN96yAmR9uxkxgRJGLxycFN5
 I9iuict_MkQhlkgXJ3Z0HtOrvP.Eg6jO5tzPRE9zS23fN.zQb5mWCTkZO5tTD6f0v0gWiR4Ipy.Q
 WP4x.2R7E5ZW4bBZ4Dyh_CmcklfnK6Xd5b6p3XFXwPn0iSWp1EyX7y7eKWSqjAzLG9e4sLtj4Ms8
 OA9jegw6OLMyuMrqCGCN6aJ6mlG6jhFhiPgl8AkiPLFOD.KEoqO4IkMnkBE_cyF3EpqnDZOqHnbS
 1eg3T_W027MlCxYxaQnjXm3ovfPg3S2zbHe4E2Su6n5D7vpK_pcTsL.VBJP7M31FkZABOboMXUl8
 9OjG9feh6TKi7q1wcG4iNFhgeOlXfcxzG.1zgrTbib79_ZBbsgsob9dNCzCFEZkf8dhcXeqBGA8D
 35Re5Hm2sZgi1YAJK0qvF5hPlMFmciJVbhlYm9hDa50iGdskBZoLcn1SJFHjx6yxBNbXWnD2vqiX
 zMwjsMNeICbbzvVLzWiA7iHhQ1jUvnKO8xGwQXjGy3b8CA2wQ6LOf4G2wabay9gwtSzKpAoNCRwf
 2903ZRu3jb1qoz3OXVdKb6G9phej1Yr1.G2LnSPYfiZGYNhFEsRXWF9JMI7IEX2TGbS6Yy4brrPf
 TNrZ4dFaKP1cNxLBT7tQKWqHopat3VrDLHWs0pfcgBKvk1wJjWiVZuRPdMtlQ5m.YBhpcT3KeubG
 2Nddz9SCkTCdE9dLB6PQOLpd6IfCLw9clJNhKfccV1hvMEJ6B0Si2Dm5lG6ehw0.HhcC61YrSuNo
 MZTp9MbC.z0KejFZeSUufaJa.0QwifMQkyjMV7LWTZnp.fo2C2RYgPyxqZCc46kXctvazZO.6WuD
 2puR7R75dq8bRw77TcUQ.gG1I6Lv4sdt8Fxf84nPpOLxQ0VR_kRW.3StmliYVsqwshi_2FIMrC.i
 JraN9OfrRBrDGTnKPvU4OpTs8nRiDZNPm.CboKKDWSWk6uMsAXNkpyxWW7dRodvE1zI1oKKFsniL
 0ArNumaHMH7b9R6glIEZlbmcJ3zn.5mQyOhh0J4YxJszoanvccTV_P02lqJGioEc-
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 4d60b986-7ed3-4d05-823c-5d7a7b7466b1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 31 May 2023 14:17:14 +0000
Received: by hermes--production-ne1-574d4b7954-bq277 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 174ebacd8784abefa7ff5b7a2ade66e9; 
 Wed, 31 May 2023 14:17:11 +0000 (UTC)
Message-ID: <cbd61b82-43e1-ad4d-e984-775f1209948c@schaufler-ca.com>
Date: Wed, 31 May 2023 07:17:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Christoph Hellwig <hch@lst.de>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
 <20230530142826.GA9376@lst.de>
 <301a58de-e03f-02fd-57c5-1267876eb2df@schaufler-ca.com>
 <20230531132200.GB30016@lst.de>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20230531132200.GB30016@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
 linux-unionfs@vger.kernel.org, linux-cifs@vger.kernel.org, paul@paul-moore.com,
 miklos@szeredi.hu, mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 tom@talpey.com, Casey Schaufler <casey@schaufler-ca.com>,
 wangweiyang2@huawei.com, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>,
 eparis@parisplace.org, hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com,
 Christian Brauner <brauner@kernel.org>, john.johansen@canonical.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: schaufler-ca.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/31/2023 6:22 AM, Christoph Hellwig wrote:
> On Tue, May 30, 2023 at 07:55:17AM -0700, Casey Schaufler wrote:
>> Which LSM(s) do you think ought to be deprecated?
> I have no idea.  But what I want is less weirdo things messing with
> VFS semantics.

I am curious what you consider a weirdo thing done by LSMs. Things like
io_uring are much stranger than anything an LSM does.

>
>> I only see one that I
>> might consider a candidate. As for weird behavior, that's what LSMs are
>> for, and the really weird ones proposed (e.g. pathname character set limitations)
>> (and excepting for BPF, of course) haven't gotten far.
> They haven't gotten far for a reason usually.  Trying to sneak things in
> through the back door is exactly what is the problem with LSMs.

Mostly developers play by the rules, and we don't let things sneak in. 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

